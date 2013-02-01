#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class CreateLineItems < ActiveRecord::Migration
  def self.up
    create_table :line_items do |t|
      t.column "product_id", :int
      t.column "order_id", :int
      t.column "quantity", :int
      t.column "unit_price", :decimal, :precision => 8, :scale => 2
    end
  end

  def self.down
    drop_table :line_items
  end
end
