#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require "connect"
require "logger"

#ActiveRecord::Base.logger = Logger.new(STDOUT)

ActiveRecord::Schema.define do
  
  create_table :articles, :force => true do |t|
    t.column :name, :string
  end
  
  create_table :users, :force => true do |t|
    t.column :name, :string
  end
  create_table :readings, :force => true do |t|
    t.column :article_id, :integer
    t.column :user_id, :integer
    t.column :read_at, :datetime
    t.column :rating, :integer
  end
  
end

class Reading < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
end

class Article < ActiveRecord::Base
  has_many :readings
  has_many :readers, :through => :readings, :source => :user 
  has_many :happy_users, :through => :readings,  :source => :user, :conditions => 'readings.rating = 5'  
end

class User < ActiveRecord::Base
  has_many :readings
  has_many :articles, :through => :readings do
    def rated_at_or_above(rating)
      find :all, :conditions => ['rating >= ?', rating]
    end
  end
end

if false
u1 = User.create(:name => "dave")
u2 = User.create(:name => "mike")

a = Article.create(:name => "Join Models")


a.readings.create(:user => u1, :read_at => Time.now, :rating => 5)
a.readings.create(:user => u2, :read_at => 1.day.ago, :rating => 3)

p u2.articles.rated_at_or_above(4)

p a.readers

p a.readers.find(:all, :conditions => [ 'rating >= ?', 3])

p u1.articles
p u2.articles

puts "Happy"
p a.happy_users
end


a = Article.create(:name => "My Article")

u = User.create(:name => "pragdave")

u.articles << a << a
p u.articles


u = User.find(:first)
p u.articles


