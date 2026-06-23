# Technical SEO Report

Score: **86/100**

## What Passed

- `http://adamhillerlaw.com` redirects to `https://adamhillerlaw.com/`.
- `https://www.adamhillerlaw.com` redirects to `https://adamhillerlaw.com/`.
- `robots.txt` is available and permissive.
- `sitemap.xml` is available and referenced in `robots.txt`.
- Sampled canonical pages returned `200` and self-canonicalized.
- No blocking `noindex` or `X-Robots-Tag` was found on the main canonical URLs.
- Mobile basics are present: responsive viewport and same crawlable HTML.
- Security headers are solid for a brochure site: HSTS, CSP, `X-Frame-Options`, and `X-Content-Type-Options`.
- Tested nonexistent URLs returned `404`, not soft-200s.

## Findings

### Medium

1. `/mediation/` does not issue a clean HTTP redirect. It returns `200 OK` with an HTML/meta-refresh redirect pattern to `/mediation`, while other slash variants return proper redirects.
2. `/mediation` looks orphan-prone. It is in the sitemap but did not appear in the sampled internal-link set from core pages.

### Low

1. Static assets are cached for only 4 hours (`cache-control: public, max-age=14400, must-revalidate`), which is short for a mostly static Jekyll site.
2. The homepage ships several render-blocking CSS/font requests and older JS libraries. I did not run Lighthouse successfully here, but this is the clearest source-level performance risk.
3. The sitemap has no `<lastmod>`, which slightly weakens freshness signaling.

## Performance Note

The public PageSpeed Insights request returned `429` during this audit, so I could not attach CrUX-backed CWV numbers. Based on source only, this site is not obviously bloated, but fonts, blocking CSS, and legacy JS are enough to keep performance in the middle rather than the top tier.

Estimated performance score used in the summary weighting: **58/100**.

## Repo-Backed Verifications

- `_config.yml` confirms Jekyll + `jekyll-sitemap` + `jekyll-redirect-from`.
- `_includes/head.html` confirms multiple Google Fonts requests and sitewide meta handling.

## Recommended Fix Order

1. Make `/mediation/` resolve with a real `301` or `308` redirect.
2. Add a crawlable internal link to `/mediation` from a prominent page if it should rank.
3. Improve asset caching and reduce render-blocking font/CSS cost.
