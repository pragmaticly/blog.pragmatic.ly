require 'time'

xml.instruct!
xml.urlset 'xmlns' => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  sitemap.resources.select { |page| page.path =~ /\.html/ }.each do |page|
    xml.url do
      xml.loc "#{data.sitemap.url}#{page.url}"
      if page.data["date"]
        xml.lastmod Time.parse(page.data["date"]).iso8601
      else
        xml.lastmod Date.today.to_time.iso8601
      end
      xml.changefreq page.data.changefreq || "monthly"
      xml.priority page.data.priority || "0.8"
    end
  end
end
