#!/usr/bin/ruby
require 'pry-byebug'
require 'kimurai'

class JobScraper < Kimurai::Base
  @name= 'adda_scraper'
  @start_urls = ["https://meroadda.com"]
  @engine = :selenium_firefox

  def scrape_page
    doc = browser.current_response
    binding.pry
    name = doc.css('div.image2').css('h4').text
    # to get number and email
    nodelist = doc.css('div.lawyer-profile')[0].css('p')
    nodes = []
    nodelist.each {|node| nodes << node.text}
    p nodes
  end

  def parse(response, url:, data: {})
    scrape_page
  end
end

JobScraper.crawl!
