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
require 'pp'

# Connection code omitted...

class BadBook < ActiveRecord::Base
  set_primary_key "isbn"
end


BadBook.delete_all

pp BadBook.columns_hash.keys

	 book = BadBook.new
         book.id   = "0-12345-6789"
         book.title = "My Great American Novel"
         book.save

	 # ...
    
         book = BadBook.find("0-12345-6789")
         puts book.title  # => "My Great American Novel"
puts book.id
p book.attributes
