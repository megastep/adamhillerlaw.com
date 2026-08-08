const MARKDOWN_MIME_TYPE = "text/markdown; charset=utf-8";

function acceptsMarkdown(accept) {
  return accept.split(",").some((entry) => {
    const [mediaType, ...parameters] = entry.trim().toLowerCase().split(";");
    if (mediaType.trim() !== "text/markdown") return false;

    const quality = parameters.find((parameter) => parameter.trim().startsWith("q="));
    return !quality || Number(quality.trim().slice(2)) > 0;
  });
}

function markdownPathFor(pathname) {
  const path = pathname.endsWith("/") ? `${pathname}index` : pathname.replace(/\.html$/, "");
  return `/__markdown${path}.md`;
}

function withVaryAccept(response) {
  const headers = new Headers(response.headers);
  const vary = headers.get("Vary");
  if (!vary) {
    headers.set("Vary", "Accept");
  } else if (!vary.split(",").some((value) => value.trim().toLowerCase() === "accept")) {
    headers.set("Vary", `${vary}, Accept`);
  }
  return new Response(response.body, { status: response.status, statusText: response.statusText, headers });
}

function markdownResponse(asset, method) {
  const headers = new Headers(asset.headers);
  headers.set("Content-Type", MARKDOWN_MIME_TYPE);
  headers.delete("Content-Encoding");
  headers.delete("Content-Range");
  headers.delete("ETag");
  headers.delete("Last-Modified");
  headers.set("x-markdown-tokens", String(Math.ceil((headers.get("Content-Length") || 0) / 4)));
  headers.delete("Content-Length");
  return withVaryAccept(new Response(method === "HEAD" ? null : asset.body, { status: asset.status, statusText: asset.statusText, headers }));
}

export async function onRequest(context) {
  const { request, env } = context;
  const method = request.method.toUpperCase();
  if (!['GET', 'HEAD'].includes(method) || !acceptsMarkdown(request.headers.get("Accept") || "")) {
    return withVaryAccept(await context.next());
  }

  const markdownUrl = new URL(request.url);
  markdownUrl.pathname = markdownPathFor(markdownUrl.pathname);
  const asset = await env.ASSETS.fetch(new Request(markdownUrl, { method }));
  return asset.ok ? markdownResponse(asset, method) : withVaryAccept(await context.next());
}
