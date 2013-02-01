#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
$: << File.dirname(__FILE__)
require "connect"
require "logger"
require "pp"

ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"


class Order < ActiveRecord::Base
end

o1 = Order.new
o2 = Order.new

o1.id = "wibble"
o2.id = "wobble"

hash = {
  o1 => "one",
  o2 => "two"
}

p hash

res = Order.connection.select_all("select id, quantity*unit_price as total from line_items")
pp res
