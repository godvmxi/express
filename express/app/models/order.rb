class Order < ActiveRecord::Base
  attr_accessible :charge, :estimateTermDate, :expressNum, :expressProvider, :orderContent, :orderDate, :orderDispNum, :orderState, :paymentType, :posterID, :posterNote, :receiverID, :senderID, :servicePoints, :serviceProcess, :serviceSuggest, :shipmentType, :specialHandling, :specialOffer, :userNote, :volume, :weight
  def set_user_data
    @porterID = 'test'
  end
  def init_new_order
    @userNote = 'test'
  end
end
