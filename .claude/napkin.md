# Napkin

## Corrections
| Date | Source | What Went Wrong | What To Do Instead |
|------|--------|----------------|-------------------|
| 2026-03-06 | self | Assumed the repo already had a napkin file | Check `.claude/napkin.md` first every session and create it immediately if missing |

## User Preferences
- For this task, analyze only live-verifiable technical SEO factors and do not write project files beyond required agent memory.

## Patterns That Work
- Use live HTTP requests and page source to verify technical SEO claims instead of inferring from repo code alone.
- For small brochure sites, compare sitemap URLs against sitewide internal links to catch orphan-prone pages quickly.
- For content audits here, read the source Markdown too, because practice-area detail lives in page copy while metadata and schema live in rendered HTML.
- For this repo, write audit deliverables into a dedicated `seo/` directory so the summary and specialist reports stay easy to scan.

## Patterns That Don't Work
- Starting a site audit before confirming the repo napkin state violates workspace instructions.

## Domain Notes
- `adamhillerlaw.com` is being audited for technical SEO with live-only evidence.
- As of 2026-03-06, `/mediation/` returns `200` while `/mediation` is canonicalized without a slash; other core pages redirect slash variants with `308`.
- As of 2026-03-06, the site exposes only 7 sitemap URLs; the limiting factor is shallow service-page inventory, not crawl blocking.
- As of 2026-03-06, `_config.yml` stores Wilmington geo coordinates with `long` and `lat` reversed relative to their actual values, and `_includes/head.html` emits them directly into geo meta tags.
