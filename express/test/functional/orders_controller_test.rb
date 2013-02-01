require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { charge: @order.charge, estimateTermDate: @order.estimateTermDate, expressNum: @order.expressNum, expressProvider: @order.expressProvider, orderContent: @order.orderContent, orderDate: @order.orderDate, orderDispNum: @order.orderDispNum, orderState: @order.orderState, paymentType: @order.paymentType, posterID: @order.posterID, posterNote: @order.posterNote, receiverID: @order.receiverID, senderID: @order.senderID, servicePoints: @order.servicePoints, serviceProcess: @order.serviceProcess, serviceSuggest: @order.serviceSuggest, shipmentType: @order.shipmentType, specialHandling: @order.specialHandling, specialOffer: @order.specialOffer, userNote: @order.userNote, volume: @order.volume, weight: @order.weight }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    put :update, id: @order, order: { charge: @order.charge, estimateTermDate: @order.estimateTermDate, expressNum: @order.expressNum, expressProvider: @order.expressProvider, orderContent: @order.orderContent, orderDate: @order.orderDate, orderDispNum: @order.orderDispNum, orderState: @order.orderState, paymentType: @order.paymentType, posterID: @order.posterID, posterNote: @order.posterNote, receiverID: @order.receiverID, senderID: @order.senderID, servicePoints: @order.servicePoints, serviceProcess: @order.serviceProcess, serviceSuggest: @order.serviceSuggest, shipmentType: @order.shipmentType, specialHandling: @order.specialHandling, specialOffer: @order.specialOffer, userNote: @order.userNote, volume: @order.volume, weight: @order.weight }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
