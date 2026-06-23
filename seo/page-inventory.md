# Page Inventory

Live crawl based on `https://adamhillerlaw.com/sitemap.xml` on `2026-03-06`.

## Indexed URL Set

| URL | Title Length | Meta Description Length | H1 Count | Word Count | JSON-LD Blocks | Notes |
| --- | ---: | ---: | ---: | ---: | ---: | --- |
| `/` | 54 | 86 | 1 | 159 | 2 | Homepage is very thin for a legal service homepage |
| `/about` | 48 | 86 | 1 | 910 | 1 | Best depth and strongest E-E-A-T page |
| `/community` | 39 | 86 | 1 | 177 | 1 | Thin support/trust page |
| `/links` | 47 | 86 | 1 | 384 | 1 | Useful utility page, weak client intent |
| `/mediation` | 27 | 86 | 1 | 326 | 1 | Title is short; content is too thin for a service page |
| `/privacy` | 32 | 86 | 1 | 209 | 1 | Utility page |
| `/terms` | 34 | 86 | 1 | 265 | 1 | Utility page |

## On-Page Observations

- Titles are unique and mostly within acceptable length.
- Meta descriptions are short and reused across the site, which is the main on-page weakness.
- Canonicals were present and self-referential on sampled canonical URLs.
- Each crawled page had exactly one `H1`.
- The sitewide nav exposed `about`, `community`, and `links`, but not `mediation` in the sampled crawl.

## Quality Gate Comparison

Using the loaded SEO reference thresholds:

- Homepage target: `500+` words. Actual: `159`.
- About page target: `400+` words. Actual: `910`.
- Service page target: `800+` words. `/mediation` actual: `326`.

## On-Page Score: 61/100

Why it landed here:

- Positive: unique titles, clean canonicals, single H1s, valid core pages.
- Negative: weak meta descriptions, thin conversion pages, thin homepage, generic CTA language, and limited page set for key topics.
