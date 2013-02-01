class Order < ActiveRecord::Base
  attr_accessible :charge, :estimateTermDate, :expressNum, :expressProvider, :orderContent, :orderDate, :orderDispNum, :orderState, :paymentType, :posterID, :posterNote, :receiverID, :senderID, :servicePoints, :serviceProcess, :serviceSuggest, :shipmentType, :specialHandling, :specialOffer, :userNote, :volume, :weight
end
