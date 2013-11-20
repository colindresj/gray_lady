class Scraper
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def get_hrefs
    html = HTTParty.get @url
    doc = Nokogiri::HTML(html)
    links = doc.css('a').map { |link| link['href'] }
    links.flatten
  end

  def get_images
    html = HTTParty.get @url
    doc = Nokogiri::HTML(html)
    images = doc.css('img').map { |img| img['src'] }
    images.flatten
  end

end
