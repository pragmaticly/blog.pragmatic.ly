# -*- coding: utf-8 -*-
xml.instruct!
xml.rss "xmlns:atom" => "http://www.w3.org/2005/Atom", "version" => "2.0" do
  xml.channel do
    xml.id "https://fengche.co/blog"
    xml.title "Fengche.co Blog"
    xml.link "https://fengche.co/blog"
    xml.language "en-us"
    xml.copyright "&#x2117; &amp; &#xA9; 2012-2014 Fengche.co"
    xml.link "href" => "https://fengche.co/blog"
    xml.link "href" => "https://fengche.co/blog/feed.xml", "rel" => "self"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.description "The voice of The Fengche.co Team sharing News, Thoughts & Fun."
    xml.author { xml.name "The Fengche.co Team" }

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link "https://fengche.co/blog#{article.url}"
        xml.description article.body, "type" => "html"
        xml.guid "tag:blog.fengche.co,article.url"
        xml.pubDate article.date.to_time.iso8601
        xml.category article.tags.join(', ')
      end
    end
  end
end
