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

class Bool < ActiveRecord::Base
end

Bool.delete_all
Bool.create(:flag => true)
b = Bool.find(:first)
pp b
puts b.flag? ? "TRUE" : "FALSE"
pp b.flag

Bool.delete_all
Bool.create(:flag => false)
b = Bool.find(:first)
pp b

puts b.flag? ? "TRUE" : "FALSE"
pp b.flag
