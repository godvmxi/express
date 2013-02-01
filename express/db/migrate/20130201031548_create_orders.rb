class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :orderDispNum
      t.integer :orderState
      t.string :expressNum
      t.integer :senderID
      t.integer :receiverID
      t.datetime :orderDate
      t.string :orderContent
      t.integer :posterID
      t.datetime :estimateTermDate
      t.string :servicePoints
      t.string :serviceSuggest
      t.string :serviceProcess
      t.integer :expressProvider
      t.integer :shipmentType
      t.string :specialHandling
      t.integer :paymentType
      t.string :specialOffer
      t.string :userNote
      t.string :posterNote
      t.integer :weight
      t.string :volume
      t.integer :charge

      t.timestamps
    end
  end
end
