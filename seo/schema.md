# Schema Report

Score: **64/100**

## Live Markup Found

- Homepage: `WebSite`, `LegalService`
- Interior pages: mostly `WebPage`

## What Is Working

- The homepage uses the right core business type for a law firm: `LegalService`.
- The homepage schema includes real entity details such as name, URL, phone, address, geo, and opening hours.
- No obviously spammy or deprecated schema was found.

## Findings

### Medium

1. Relevant schema is concentrated on the homepage. Most interior pages are typed only as generic `WebPage`.
2. The `LegalService` block is useful but thin. It is missing stronger fields like `description`, `email`, `areaServed`, `logo`, `legalName`, `contactPoint`, and clearer links to the attorney as a `Person`.
3. The site lacks a connected entity graph with stable `@id` values linking firm, attorney, and page intent.

### Low

1. `/about` would be stronger as `AboutPage` and likely should reference a reusable `Person` node for Adam Hiller.
2. `/mediation` should be typed as a `Service` page tied back to the firm.
3. `/links` could be a `CollectionPage`.
4. `BreadcrumbList` is absent on interior pages.

## Repo Verification

`_config.yml` and `_includes/head.html` confirm that geo meta fields are currently output as:

- `geo.position`: `long;lat`
- `ICBM`: `long, lat`

For Wilmington, Delaware, the values in `_config.yml` are:

- `long: 39.748890`
- `lat: -75.543002`

Those labels are reversed. The longitude should be around `-75.543002` and the latitude should be around `39.748890`.

## Recommended Schema Model

1. Keep `LegalService` on the homepage as the core business entity.
2. Add a reusable `Person` node for Adam Hiller and connect it with the firm.
3. Convert `/about` to `AboutPage` plus `Person`.
4. Convert `/mediation` to `Service` plus provider linkage.
5. Add `BreadcrumbList` where hierarchy is clear.
