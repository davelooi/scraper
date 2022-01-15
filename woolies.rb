require 'selenium-webdriver'
require 'pry'

class Woolies
  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def scrape(url)
    driver.get(url)
    title = driver.find_element(:class, "shelfProductTile-title").text
    dollar = driver.find_element(:class, "price-dollars").text
    cents = driver.find_element(:class, "price-cents").text
    price = "#{dollar}.#{cents}"

    puts "title=#{title}"
    puts "price=#{price}"
  end

  def quit
    @driver.quit
  end

  private

  attr_reader :driver
end

woolies = Woolies.new
woolies.scrape('https://www.woolworths.com.au/shop/productdetails/826730/smith-s-crinkle-cut-potato-chips-original')
woolies.scrape("https://www.woolworths.com.au/shop/productdetails/531015/woolworths-beef-stir-fry")
woolies.quit
