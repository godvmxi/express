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
require "rubygems"
require_gem "activerecord"

#require "./nested_set.rb"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do

  
  create_table :categories, :force => true do |t|
    t.column :name, :string
    t.column :parent_id, :integer
    t.column :lft, :integer
    t.column :rgt, :integer
  end
  
end

class Category < ActiveRecord::Base
  acts_as_nested_set  
end


Category.delete_all



def add_child(parent, name)
  child = Category.create(:name => name)
  parent.add_child(child) || fail("Couldn't add #{name}")
  child
end

root        = Category.create(:name => "Books")

fiction     = add_child(root, "Fiction")

non_fiction = add_child(root, "Non Fiction")

              add_child(non_fiction, "Science")
              add_child(non_fiction, "History")
              
computers   = add_child(non_fiction, "Computers")
              add_child(computers,   "Software")
              add_child(computers,   "Hardware")

              add_child(fiction,     "Mystery")
              add_child(fiction,     "Romance")
              add_child(fiction,     "Science Fiction")


def display_children(list)
  puts list.map {|child| child.name + "[#{child.id}]" }.join(", ")
end


display_children(root.direct_children)         # Fiction, Non Fiction

display_children(non_fiction.direct_children)  #Science[129], History[130], Computers[131]
display_children(non_fiction.all_children)     #Romance[135], Science Fiction[136]
display_children(non_fiction.full_set)         #Romance[135], Science Fiction[136], Non Fiction[128], Science[129]

