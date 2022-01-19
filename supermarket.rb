require 'selenium-webdriver'
require 'pry'

class Supermarket
  def initialize(driver: default_driver)
    @driver = driver
  end

  def default_driver
    Selenium::WebDriver.for :remote, url: "http://localhost:4444/wd/hub"
  end

  def scrape(url)
    driver.get(url)
  end

  def scrape(url)
    driver.get(url)

    Product.new(
      title: find_title,
      price: find_price,
      in_stock: in_stock?
    )
  end

  def find_title
    raise NotImplementedError
  end

  def find_price
    raise NotImplementedError
  end

  def in_stock?
    raise NotImplementedError
  end

  def quit
    driver.quit
  end

  private

  attr_reader :driver

  Product = Struct.new(:title, :price, :in_stock, keyword_init: true)
end
