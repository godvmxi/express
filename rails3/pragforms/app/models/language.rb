#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class Language < ActiveRecord::Base
  validates_length_of :name, :minimum=>1
  validates_numericality_of :shortest_wiki
  validates_each :shortest_wiki do |r,at,val|
    r.errors.add at, 'Must be > 0' if !val || val < 0
  end
end
