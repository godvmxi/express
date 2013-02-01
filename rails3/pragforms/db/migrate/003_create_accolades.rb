#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class CreateAccolades < ActiveRecord::Migration
  def self.up
    create_table :accolades do |t|
      t.column :name, :string
      t.column :received, :date
      t.column :user_id, :int
    end
  end

  def self.down
    drop_table :accolades
  end
end
