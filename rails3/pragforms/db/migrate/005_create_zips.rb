#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class CreateZips < ActiveRecord::Migration
  def self.up
    create_table :zips do |t|
      t.column :zip, :string
      t.column :city, :string
      t.column :state, :string
      t.column :created_at, :datetime
      t.column :edited_at, :datetime
      t.column :lock_version, :int, :default=>0
    end
  end

  def self.down
    drop_table :zips
  end
end
