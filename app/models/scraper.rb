class Scraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_hrefs
    html = HTTParty.get @url
    doc = Nokogiri::HTML(html)
    doc.css('a').map { |link| link['href'] }
  end

  def get_images
    html = HTTParty.get @url
    doc = Nokogiri::HTML(html)
    doc.css('img').map { |img| img['src'] }
  end

end
