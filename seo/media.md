# Image And Media Report

Score: **34/100**

## Findings

### High

1. The live site has effectively no semantic content images on key pages. Across the core sitemap URLs, I found `0` live `<img>` tags carrying meaningful page content.
2. The hero and contact visuals are CSS background images, not content images. That means no alt text value and much weaker image-search utility.
3. The sitewide `og:image` is a generic logo. It is not a strong social-card asset and is reused across pages.
4. The site misses major local-trust media opportunities: no attorney headshot, office/interior imagery, courthouse-context visuals, or community photos.

### Medium

1. Media strategy is minimal and dated. The repo image set is basically a header image, a contact image, and logo files.
2. Cloudflare image formatting helps, but there are no responsive image variants or page-specific media assets.
3. Empty-alt patterns still exist in dormant template includes, which is a latent hygiene issue if those sections are ever enabled.

### Low

1. There is leftover template media debt in portfolio/example content, including placeholders and third-party raw-image links.

## Repo Verification

- `_data/style.yml` defines the background-driven image strategy.
- `_includes/head.html` outputs the same logo-based `og:image` sitewide.

## Recommended Media Actions

1. Add at least one attorney-focused and one office/location-focused content image to the homepage and About page.
2. Create a proper social-card image for the site and page-specific variants for core service pages.
3. Use real `<img>` elements where the image carries meaning.
4. Clean up empty-alt patterns in dormant templates before they can ship live.
