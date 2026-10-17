#!/usr/bin/env ruby
# frozen_string_literal: true

require "json"
require "nokogiri"
require "pathname"
require "yaml"

site = Pathname(ARGV.fetch(0, "_site"))
source = Pathname(__dir__).parent
config = YAML.safe_load(source.join("_config.yml").read)
html_pages = site.glob("**/*.html")
abort "No generated HTML in #{site}" if html_pages.empty?

html_pages.each do |path|
  document = Nokogiri::HTML5(path.read)
  count = document.css('meta[name="description"]').length
  abort "#{path}: #{count} descriptions (expected at most one)" if count > 1
end

descriptions = []
%w[index about community mediation links privacy terms 404].each do |page|
  extension = page == "404" ? "html" : "md"
  frontmatter = source.join("#{page}.#{extension}").read.split(/^---\s*$\n?/, 3)[1]
  metadata = YAML.safe_load(frontmatter)
  expected = metadata.fetch("description", config.fetch("description"))
  document = Nokogiri::HTML5(site.join("#{page}.html").read)
  tags = document.css('meta[name="description"]')
  abort "#{page}: expected exactly one nonempty description" unless tags.length == 1 && !expected.strip.empty?
  abort "#{page}: wrong description selection" unless tags.first["content"] == expected

  %w[og:description twitter:description].each do |property|
    tags = document.css("meta[property='#{property}'], meta[name='#{property}']")
    abort "#{page}: incorrect #{property}" unless tags.length == 1 && tags.first["content"] == expected
  end

  route = page == "index" ? "/" : metadata.fetch("permalink", "/#{page}.html")
  canonicals = document.css('link[rel="canonical"]')
  abort "#{page}: incorrect canonical" unless canonicals.length == 1 && canonicals.first["href"] == config.fetch("url") + route

  schemas = document.css('script[type="application/ld+json"]').map { |tag| JSON.parse(tag.text) }
  abort "#{page}: missing SEO structured description" unless schemas.any? { |schema| schema["description"] == expected }
  if page == "index"
    abort "Homepage: missing LegalService schema" unless schemas.any? { |schema| schema["@type"] == "LegalService" }
  end

  descriptions << expected unless page == "404"
end
abort "Public page descriptions are repeated" unless descriptions.uniq.length == descriptions.length

puts "Validated metadata for 8 pages and description counts across #{html_pages.length} HTML files"
