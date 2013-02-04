class TempOrder
  attr_reader :title, :sender ,:receiver ,:order
  def initialize
    @order = Order.new
    @sender = 0
    @receiver = 0
  end
  def get_sender
    return @sender
  end
  def set_sender(id)
    @sender = id
    @order.senderID = id
  end
  def get_receiver
    return @receiver
  end
  def set_receiver(id)
    @receiver = id
    @order.receiverID = id
  end
  def get_order
      return @order
  end
end
