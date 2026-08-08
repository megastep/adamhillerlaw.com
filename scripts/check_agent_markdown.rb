#!/usr/bin/env ruby
# frozen_string_literal: true

require "pathname"

site = Pathname(ARGV.fetch(0, "_site"))
markdown_root = site.join("__markdown")
abort "Missing generated Markdown directory: #{markdown_root}" unless markdown_root.directory?

html_pages = site.glob("**/*.html")
missing = html_pages.reject do |html_page|
  relative = html_page.relative_path_from(site).to_s.sub(%r{index\.html\z}, "index.md").sub(/\.html\z/, ".md")
  markdown_root.join(relative).file?
end
abort "Missing Markdown companions:\n#{missing.join("\n")}" unless missing.empty?

index = markdown_root.join("index.md").read
abort "Markdown homepage still contains navigation" if index.match?(%r{class="navbar})
abort "Markdown homepage is empty" if index.strip.empty?

puts "Validated #{html_pages.length} Markdown companions"
