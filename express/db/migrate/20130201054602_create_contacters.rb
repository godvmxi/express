class CreateContacters < ActiveRecord::Migration
  def change
    create_table :contacters do |t|
      t.string :contacterName
      t.string :addressRegion
      t.string :detailedAddress
      t.string :company
      t.string :contactNum
      t.string :cellphoneNum
      t.string :email
      t.integer :postalCode
      t.integer :validFlag

      t.timestamps
    end
  end
end
