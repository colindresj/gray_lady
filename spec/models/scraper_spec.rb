require 'spec_helper'

describe Scraper do

  describe ".new" do
    it "raises an error without a url" do
      expect { Scraper.new }.to raise_error(ArgumentError)
    end

    it "takes a url on initialize" do
      scraper = Scraper.new('http://google.com')
      expect(scraper.url).to eq('http://google.com')
    end
  end

  describe "#get_hrefs" do
    it "returns an array" do
      scraper = Scraper.new('http://hellophilco.com')
      expect(scraper.get_hrefs).to be_an(Array)
    end

    it "return an empty array when the page has no links" do
      scraper = Scraper.new('http://ondemand.blackboard.com/r91/movies/bb91_course_content_create_content_using_blank_page.htm')
      page_links = []
      expect(scraper.get_hrefs).to match_array(page_links)
    end

    it "uses nokogiri to return an array of all the links on a page" do
      scraper = Scraper.new('http://jonl.org')
      jonl_links = [
        "Hi/Happier/Happier.html",
        "Hi/Engineer/Engineer.html",
        "Hi/Composer/Composer.html",
        "Hi/Entrepreneur/Entrepreneur.html",
        "http://blog.jonl.org",
        "attachments/Jonathan_Leung's_Resume.pdf",
        "http://facebook.com/friendjonathanleung",
        "http://twitter.com/jonathanjleung"
      ]
      expect(scraper.get_hrefs).to match_array(jonl_links)
    end
  end

  describe "#get_images" do
    it "returns an array" do
      scraper = Scraper.new('http://hellophilco.com')
      expect(scraper.get_images).to be_an(Array)
    end

    it "returns an empty array when the page has no images" do
      scraper = Scraper.new('http://jonl.org')
      jonl_images = []
      expect(scraper.get_images).to match_array(jonl_images)
    end

    it "uses nokogiri to return an array of all the images on a page" do
      scraper = Scraper.new('http://hellophilco.com')
      philco_images = [
        "img/philco_anime.png"
      ]
      expect(scraper.get_images).to match_array(philco_images)
    end
  end

end
