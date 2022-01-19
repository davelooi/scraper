require_relative 'woolworths'

begin
  woolies = Woolworths.new
  puts woolies.scrape('https://www.woolworths.com.au/shop/productdetails/826730/smith-s-crinkle-cut-potato-chips-original')
  puts woolies.scrape("https://www.woolworths.com.au/shop/productdetails/531015/woolworths-beef-stir-fry")
ensure
  woolies.quit
end
