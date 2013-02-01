#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class PopulateData < ActiveRecord::Migration
  def self.up
    p1 = Product.create(:title => "Programming Ruby, 2nd Edition", :price => 44.95,
                        :image_location => "images/ruby.png");
    p2 = Product.create(:title => "Pragmatic Project Automation", :price => 29.95,
                        :image_location => "images/auto.jpg");

    o1 = Order.create(:name => "Dave Thomas", :email => "dave@pragprog.com");

    LineItem.create(:product_id => p1.id, :order_id => o1.id, :quantity => 1, :unit_price => p1.price)
    LineItem.create(:product_id => p2.id, :order_id => o1.id, :quantity => 1, :unit_price => p1.price)
  end

  def self.down
    LineItem.delete_all
    Order.delete_all
    Product.delete_all
  end
end
