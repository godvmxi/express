require 'test_helper'

class ShipOrderControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get insert_sender" do
    get :insert_sender
    assert_response :success
  end

end
