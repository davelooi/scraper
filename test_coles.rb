require_relative 'coles'

begin
  coles = Coles.new
  puts coles.scrape("https://shop.coles.com.au/a/national/product/smiths-crinkle-cut-original-potato-chips")
  puts coles.scrape("https://shop.coles.com.au/a/national/product/coles-beef-stir-fry-9990965p")
ensure
  coles.quit
end
