xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Crafty Blues"
  xml.subtitle "One man's trash"
  xml.id "http://craftyblues.com/"
  xml.link "href" => "http://craftyblues.com/"
  xml.link "href" => "http://craftyblues.com/feed.xml", "rel" => "self"
  xml.updated blog.articles.first.date.to_time.iso8601
  xml.author { xml.name "Ryan Parsley" }
  xml.image do
    xml.url "http://craftyblues.com/images/logo.png"
    xml.link "http://craftyblues.com"
    xml.title "CraftyBlues"
  end
  xml.icon  "http://craftyblues.com/images/favicon.ico"
  xml.logo  "http://craftyblues.com/images/logo.png"

  blog.articles[0..5].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "Ryan Parsley" }
      xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end
