# AI Search Readiness Report

Score: **40/100**

## Why The Score Is Low

This site is not blocked from AI discovery, but it is not especially optimized for AI-assisted search or answer extraction either.

## Findings

### High

1. `llms.txt` is absent at both `/llms.txt` and `/.well-known/llms.txt`.
2. The site has very little answer-shaped, citation-friendly content. Most pages are short and do not present dense, quotable explanations of issues, jurisdictions, or service fit.

### Medium

1. Entity clarity is decent but not fully packaged. The firm and attorney are identifiable, yet the schema graph is not strong and the service-page inventory is too small.
2. Freshness and update signals are weak, which reduces confidence for answer engines on legal topics.
3. The site lacks dedicated pages for the main legal topics it wants to be known for, so AI systems have little page-level granularity to cite.

### Low

1. `robots.txt` is permissive, so there is no obvious crawl blockage for AI agents that respect standard crawling rules.
2. `/.well-known/security.txt` exists, which is a positive site-governance signal, though not an SEO driver.

## Practical GEO Recommendations

1. Add dedicated service pages written in answer-first format.
2. Add concise sections that directly answer client questions such as jurisdiction, case types, process, and when to contact the firm.
3. Add `llms.txt` if the firm wants a clearer AI-discovery posture.
4. Strengthen structured data so firm, attorney, and services are easier for machines to resolve.
