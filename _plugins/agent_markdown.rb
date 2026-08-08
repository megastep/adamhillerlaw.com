# frozen_string_literal: true

# Generates static Markdown companions for the rendered HTML pages. Cloudflare
# Pages middleware serves these only to clients that explicitly negotiate
# `Accept: text/markdown`; browsers continue to receive the HTML files.
require "fileutils"
require "nokogiri"
require "reverse_markdown"
require "yaml"

module AgentMarkdown
  OUTPUT_DIRECTORY = "__markdown"
  CONTENTLESS_SELECTORS = [
    "script:not([type='application/ld+json'])",
    "style",
    "noscript",
    "nav",
    "footer",
    ".fa-stack",
    "[aria-hidden='true']"
  ].freeze

  module_function

  def generate(site)
    output_root = File.join(site.dest, OUTPUT_DIRECTORY)
    FileUtils.rm_rf(output_root)

    Dir.glob(File.join(site.dest, "**", "*.html")).sort.each do |html_path|
      markdown_path = markdown_path_for(site.dest, output_root, html_path)
      FileUtils.mkdir_p(File.dirname(markdown_path))
      File.write(markdown_path, markdown_for(html_path), mode: "w:UTF-8")
    end
  end

  def markdown_path_for(destination, output_root, html_path)
    relative = html_path.delete_prefix("#{destination}/")
    relative = relative.sub(%r{index\.html\z}, "index.md")
    relative = relative.sub(/\.html\z/, ".md")
    File.join(output_root, relative)
  end

  def markdown_for(html_path)
    document = Nokogiri::HTML5(File.read(html_path, encoding: "UTF-8"))
    frontmatter = frontmatter_for(document)
    json_ld = document.css("script[type='application/ld+json']").map(&:text).map(&:strip).reject(&:empty?)

    CONTENTLESS_SELECTORS.each { |selector| document.css(selector).remove }
    document.css("header.masthead.page").remove
    content = document.at_css("main") || document.at_css("#pagecontainer") || document.at_css("body")
    markdown = ReverseMarkdown.convert(content.to_html, unknown_tags: :bypass)
      .gsub(/(?:&nbsp;|\u00A0)/, " ")
      .strip

    [frontmatter, markdown, json_ld.empty? ? nil : "```json\n#{json_ld.join("\n")}\n```"].compact.join("\n\n") + "\n"
  end

  def frontmatter_for(document)
    title = meta_content(document, "name", "title") || meta_content(document, "property", "og:title") || document.at_css("title")&.text&.strip
    description = meta_content(document, "name", "description") || meta_content(document, "property", "og:description")
    image = meta_content(document, "property", "og:image")
    metadata = { "title" => title, "description" => description, "image" => image }.compact
    return nil if metadata.empty?

    "---\n#{YAML.dump(metadata).sub(/\A---\s*\n/, "").strip}\n---"
  end

  def meta_content(document, attribute, value)
    document.at_css("meta[#{attribute}='#{value}']")&.[]("content")&.strip
  end
end

Jekyll::Hooks.register :site, :post_write do |site|
  AgentMarkdown.generate(site)
end
