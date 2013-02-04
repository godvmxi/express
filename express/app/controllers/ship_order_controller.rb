class ShipOrderController < ApplicationController


  def initialize

  end
  def index
      @temp_order = find_session
      @contacters = Contacter.all;
      @sender = Contacter.find_all_by_id(@temp_order.get_sender)
      @receiver = Contacter.find_all_by_id(@temp_order.get_receiver)

  end

  def insert_sender
    @temp_order = find_session
    @temp_order.set_sender(params[:id])
    @sender = Contacter.find_all_by_id(  @temp_order.get_sender )
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
end
