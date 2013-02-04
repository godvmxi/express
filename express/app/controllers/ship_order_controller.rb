class ShipOrderController < ApplicationController
  def initialize

  end
  def index
      @temp_order = find_session
      @contacters = Contacter.all;
      #get send msg id
      @id = @temp_order.get_sender
      if @id == 0
        @sender = Contacter.new
      else
        @sender = Contacter.find_all_by_id(@id)
      end
      #get receiver msg id
      @id = @temp_order.get_receiver
      if @id == 0
        @receiver = Contacter.new
      else
        @receiver = Contacter.find_all_by_id(@id)
      end
      #get order msg
      @order = @temp_order.get_order
      init_new_order(@order)

  end

  def insert_sender
    @temp_order = find_session
    @temp_order.set_sender(params[:id])
    redirect_to('/ship_order/index')
  end

  def insert_receiver
    @temp_order = find_session
    @temp_order.set_receiver(params[:id])
    @receiver= Contacter.find_all_by_id(  @temp_order.get_receiver )
    redirect_to('/ship_order/index')
  end


  private
  def find_session
    session[:temp_order] ||= TempOrder.new
    return session[:temp_order]
  end
  def init_new_order(test)
    test.posterID= '0'
    test.userNote= 'fuck you'
  end
  def create_order
    @temp_order = find_session

    @id = @temp_order.get_sender
    if @id == 0
      @sender = Contacter.new
    else
      @sender = Contacter.find_all_by_id(@id)
    end
    @sender.save
  end

end
