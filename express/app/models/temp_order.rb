class TempOrder
  attr_reader :title, :sender ,:receiver
  def initialize
    @sender = 1
    @receiver = 1
  end
  def get_sender
    return @sender
  end
  def set_sender(id)
    @sender = id
  end
  def get_receiver
    return @receiver
  end
  def set_receiver(id)
    @receiver = id
  end
end
