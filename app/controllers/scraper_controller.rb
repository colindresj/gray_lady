class ScraperController < ApplicationController
  def index
  end

  def links
    scraper = Scraper.new('http://nytimes.com')
    links = scraper.get_hrefs
    respond_to do |format|
      format.json { render :json => links }
    end
  end

  def pictures
    scraper = Scraper.new('http://nytimes.com')
    images = scraper.get_images
    respond_to do |format|
      format.json { render :json => images }
    end
  end
end
