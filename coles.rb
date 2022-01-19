require_relative 'supermarket'

class Coles < Supermarket
  def find_title
    product_brand = driver.find_element(:class, "product-brand").text
    product_name = driver.find_element(:class, "product-name").text
    "#{product_brand} #{product_name}"
  end

  def find_price
    dollar = driver.find_element(:class, "dollar-value").text
    cents = driver.find_element(:class, "cent-value").text
    "#{dollar}#{cents}"
  end

  def in_stock?
    find_product_flag == 'Temporarily unavailable'
  end

  def find_product_flag
    driver.find_element(:class, "product-flag").text
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end
end
