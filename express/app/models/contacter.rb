class Contacter < ActiveRecord::Base
  attr_accessible :addressRegion, :cellphoneNum, :company, :contactNum, :contacterName, :detailedAddress, :email, :postalCode, :validFlag
end
