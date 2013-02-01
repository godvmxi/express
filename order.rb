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
//建立联系人视图
rails g scaffold contacter  contacterName:string  addressRegion:string  detailedAddress:string  company:string   contactNum:string cellphoneNum:string   email:string    postalCode:integer   validFlag:integer
//建立订单视图
order orderDispNum:string orderState:integer expressNum:string senderID:integer  receiverID:integer orderDate:datetime orderContent:string posterID:integer estimateTermDate:datetime  servicePoints:string serviceSuggest:string serviceProcess:string expressProvider:integer shipmentType:integer specialHandling:string paymentType:integer specialOffer:string userNote:string posterNote:string weight:integer volume:string charge:integer

rails generate scaffold order orderDispNum:string orderState:integer expressNum:string senderID:integer receiverID:integer orderDate:datetime orderContent:string posterID:integer estimateTermDate:datetime servicePoints:string serviceSugges
:string serviceProcess:string expressProvider:integer shipmentType:integer specialHandling:string paymentType:integer specialOffer:string userNote:string posterNote:string weight:integer volume:string charge:integer -f
