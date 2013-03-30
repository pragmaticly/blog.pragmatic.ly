# -*- coding: utf-8 -*-
xml.instruct!
xml.rss "xmlns:atom" => "http://www.w3.org/2005/Atom", "version" => "2.0" do
  xml.channel do
    xml.id "http://blog.pragmatic.ly"
    xml.title "Pragmatic.ly Blog"
    xml.link "http://blog.pragmatic.ly"
    xml.language "en-us"
    xml.copyright "&#x2117; &amp; &#xA9; 2012-2013 Pragmatic.ly"
    xml.link "href" => "http://blog.pragmatic.ly/"
    xml.link "href" => "http://blog.pragmatic.ly/feed.xml", "rel" => "self"
    xml.updated blog.articles.first.date.to_time.iso8601
    xml.lastBuildDate blog.articles.first.date.to_time.iso8601
    xml.pubDate blog.articles.first.date.to_time.iso8601
    xml.description "The voice of The Pragmatic.ly Team sharing Nes, Thoughts & Fun."
    xml.author { xml.name "The Pragmatic.ly Team" }

    blog.articles.each do |article|
      xml.item do
        xml.title article.title
        xml.link "http://blog.pragmatic.ly#{article.url}"
        xml.description article.body, "type" => "html"
        xml.guid "tag:blog.pragmatic.ly,article.url"
        xml.pubDate article.date.to_time.iso8601
        xml.category article.tags.join(', ')
      end
    end
  end
end
