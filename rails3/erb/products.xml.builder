$: << "../_template/vendor/rails/activesupport/lib/active_support/vendor"

require 'rubygems'
require 'builder/xmlmarkup'

class Product
  def initialize(title, price)
    @title = title
    @price = price
  end
  attr_reader :title, :price
end

@products = [
  Product.new("Pragmatic Programmer", 12.34),
  Product.new("Rails Recipes", 23.45)
]

xml = Builder::XmlMarkup.new(:indent => 2)

#START:main
xml.div(:class => "productlist") do

  xml.timestamp(Time.now)
  
  @products.each do |product|
    xml.product do
      xml.productname(product.title)
      xml.price(product.price, :currency => "USD")
    end
  end
end
#END:main
puts xml.target!

