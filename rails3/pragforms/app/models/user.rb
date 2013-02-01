#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class User < ActiveRecord::Base
  validates_length_of :username, :minimum=>4
  has_many :accolades
  has_many :todos

  def self.find_random
    self.find(:first, :offset=>rand(self.count))
  end

  def completed_todos
    self.todos.find :all, :conditions=>['completed is not null']
  end
  
  def pending_todos
    self.todos.find :all, :conditions=>['completed is null'], :order=>:position
  end
  
end
