require_relative 'supermarket'

class Woolworths < Supermarket
  def find_title
    driver.find_element(:class, "shelfProductTile-title").text
  end

  def find_price
    dollar = driver.find_element(:class, "price-dollars").text
    cents = driver.find_element(:class, "price-cents").text
    "#{dollar}.#{cents}"
  rescue Selenium::WebDriver::Error::NoSuchElementError
    nil
  end

  def in_stock?
    find_add_to_cart_button_text == 'Add to cart'
  end

  def find_add_to_cart_button_text
    driver.find_element(:class, "cartControls-addButton").text
  end
end
