#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
$: << File.dirname(__FILE__)
require 'connect'


require 'rubygems'
require_gem 'activerecord'

# Connection code omitted...
class Order < ActiveRecord::Base
end

Order.logger = Logger.new(STDOUT)

Order.find("1' or 'a'=='a")

amount = "100' union select * from orders where id > 0'"
orders = Order.find(:all, :conditions => ["customer_id=22 and amount > '%d'", amount])

p orders.size
