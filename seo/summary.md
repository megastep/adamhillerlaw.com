# SEO Audit Summary

- Site: `https://adamhillerlaw.com`
- Audit date: `2026-03-06`
- Business type: `Local legal service / solo law practice`
- Scope: live pages in `sitemap.xml`, key technical endpoints, and repo-backed template/config verification where helpful

## Overall Score

**SEO Health Score: 64/100**

Weighted using the `seo` skill rubric:

| Category | Score | Weight | Weighted |
| --- | ---: | ---: | ---: |
| Technical SEO | 86 | 25% | 21.5 |
| Content Quality / E-E-A-T | 56 | 25% | 14.0 |
| On-Page SEO | 61 | 20% | 12.2 |
| Schema / Structured Data | 64 | 10% | 6.4 |
| Performance | 58 | 10% | 5.8 |
| Images / Media | 34 | 5% | 1.7 |
| AI Search Readiness | 40 | 5% | 2.0 |

## Executive Readout

The site is technically clean enough to be indexed and trusted, but it is too shallow to compete well for non-brand legal queries. Crawlability is mostly fine, HTTPS and canonicals are in place, and the About page carries real attorney credibility. The bigger problem is that the site only exposes a handful of indexable URLs and most of the acquisition pages are thin.

The strongest asset is trust: a real Delaware address, phone number, attorney identity, career history, admissions, and mediation credentials are all present. The weakest areas are search coverage, page-level intent match, media strategy, and reuse of those trust signals on the homepage and service pages.

## Top Findings

### Critical / High

1. The site has only **7 sitemap URLs**, with no dedicated pages for core practice areas already mentioned in the copy.
2. The homepage is **far below the 500-word homepage quality gate** and does not fully answer likely client questions.
3. Page metadata is weak: most pages reuse the same short, generic description.
4. The site has almost **no meaningful content images**, which weakens image SEO, social previews, and local trust.

### Medium

1. `/mediation` is important enough to rank, but it is thin and appears orphan-prone in sampled internal links.
2. Structured data is present, but most interior pages are typed only as generic `WebPage`.
3. The sitemap is valid, but it lacks `<lastmod>` and does not reflect a service-led site architecture.
4. URL normalization is inconsistent because `/mediation/` uses an HTML redirect pattern instead of a true HTTP redirect.

## Priority Plan

### Critical

1. Create dedicated service pages for the main practice areas already named on the site.
2. Rewrite the homepage to clearly describe who the firm serves, what matters it handles, why Delaware-specific experience matters, and what the next step is.

### High

1. Expand `/mediation` into a fuller service page with process, case types, who engages the mediator, and a clear CTA.
2. Replace generic meta descriptions with unique, page-specific copy in the 120-160 character range.
3. Add attorney and office imagery plus a real social-card image strategy.

### Medium

1. Improve schema by linking `LegalService`, `Person`, and page-specific nodes.
2. Add `<lastmod>` support to the sitemap.
3. Fix the `/mediation/` redirect behavior and add a crawlable internal link to `/mediation`.
4. Add `llms.txt` and stronger AI-readable answer sections if AI search visibility matters.

## Evidence Notes

- `robots.txt` is present and permissive.
- `sitemap.xml` is present and valid.
- PageSpeed field/lab data could not be pulled during this audit because the public PSI endpoint returned `429` during the run, so the performance score is a source-level estimate rather than a CrUX-backed measurement.
- `llms.txt` and `/.well-known/llms.txt` both returned `404` on March 6, 2026.

## Report Files

- `seo/page-inventory.md`
- `seo/technical.md`
- `seo/content-eeat.md`
- `seo/schema.md`
- `seo/sitemap-indexing.md`
- `seo/media.md`
- `seo/ai-readiness.md`
