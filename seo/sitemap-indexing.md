# Sitemap And Indexing Report

Score: **62/100**

## Current State

- `robots.txt` is present and references `https://adamhillerlaw.com/sitemap.xml`
- `sitemap.xml` is valid and lists `7` URLs
- Listed URLs returned `200` and self-canonicalized

## Findings

### High

1. The sitemap is technically fine but strategically incomplete. The site copy references multiple service areas, but the sitemap exposes only a tiny URL set: home, about, community, links, mediation, privacy, and terms.

### Medium

1. Discoverability is constrained by site architecture rather than crawl blocking. The contact experience is fragment-based, and core service topics do not exist as standalone indexable pages.
2. The sitemap lacks `<lastmod>`.

### Low

1. Utility pages like `/privacy` and `/terms` get equal sitemap presence while high-intent service pages do not exist yet.
2. The site is likely mostly indexed for what exists, but what exists is too shallow to capture much non-brand demand.

## What This Means

Search engines can likely crawl and index nearly the whole current site. The real limitation is that there is not enough strategic inventory to rank for the practice areas the firm already mentions in its own copy.

## Recommended Index Coverage Plan

1. Add dedicated URLs for the main practice areas already described on the site.
2. Add a real `/contact` page and include it in the sitemap.
3. Add `<lastmod>` support.
4. Keep future sitemap growth focused on canonical, acquisition-relevant pages first.
