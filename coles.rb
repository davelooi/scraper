require 'selenium-webdriver'
require 'pry'

class Coles
  def initialize
    @driver = Selenium::WebDriver.for :chrome
  end

  def scrape(url)
    driver.get(url)
    # binding.pry
    product_brand = driver.find_element(:class, "product-brand").text
    product_name = driver.find_element(:class, "product-name").text
    title = "#{product_brand} #{product_name}"
    dollar = driver.find_element(:class, "dollar-value").text
    cents = driver.find_element(:class, "cent-value").text
    price = "#{dollar}#{cents}"

    puts "title=#{title}"
    puts "price=#{price}"
  end

  def quit
    @driver.quit
  end

  private

  attr_reader :driver
end

coles = Coles.new
coles.scrape("https://shop.coles.com.au/a/national/product/smiths-crinkle-cut-original-potato-chips")
coles.scrape("https://shop.coles.com.au/a/national/product/coles-beef-stir-fry-9990965p")
coles.quit
