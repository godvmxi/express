#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
class AddHomeZips < ActiveRecord::Migration
  def self.up
    Zip.create(:zip=>27514, :city=>"Chapel Hill", :state=>"NC") unless Zip.find_by_zip("27514")
    Zip.create(:zip=>27707, :city=>"Durham", :state=>"NC") unless Zip.find_by_zip("27707")
  end

  def self.down
    Zip.delete_all
  end
end
