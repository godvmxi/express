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

#ActiveRecord::Base.logger = Logger.new(STDOUT)

require "rubygems"
require_gem "activerecord"

class Order < ActiveRecord::Base


 ActiveRecord::Callbacks::CALLBACKS.each do |cb|
    define_method(cb) { puts "#{cb}"}
  end

#  before_save { puts "in hook" }

#  def before_save
#    puts "BEFORE SAVE"
#  end
end
puts "========="

Order.create
o = Order.find(1)
puts "========="
o.save
