const MARKDOWN_MIME_TYPE = "text/markdown; charset=utf-8";

function acceptsMarkdown(accept) {
  return accept.split(",").some((entry) => {
    const [mediaType, ...parameters] = entry.trim().toLowerCase().split(";");
    if (mediaType.trim() !== "text/markdown") return false;

    const quality = parameters.find((parameter) => parameter.trim().startsWith("q="));
    return !quality || Number(quality.trim().slice(2)) > 0;
  });
}

function markdownPathsFor(pathname) {
  const path = pathname.replace(/\.html$/, "").replace(/\/$/, "") || "/";
  const pagePath = `/__markdown${path === "/" ? "/index" : path}.md`;
  const directoryPath = `/__markdown${path === "/" ? "/index" : `${path}/index`}.md`;
  return pagePath === directoryPath ? [pagePath] : [pagePath, directoryPath];
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
  return withVaryAccept(new Response(method === "HEAD" ? null : asset.body, { status: asset.status, statusText: asset.statusText, headers }));
}

export async function onRequest(context) {
  const { request, env } = context;
  const method = request.method.toUpperCase();
  if (!['GET', 'HEAD'].includes(method) || !acceptsMarkdown(request.headers.get("Accept") || "")) {
    return withVaryAccept(await context.next());
  }

  for (const markdownPath of markdownPathsFor(new URL(request.url).pathname)) {
    const markdownUrl = new URL(request.url);
    markdownUrl.pathname = markdownPath;
    const asset = await env.ASSETS.fetch(new Request(markdownUrl, { method }));
    if (asset.ok) return markdownResponse(asset, method);
  }
  return withVaryAccept(await context.next());
}
