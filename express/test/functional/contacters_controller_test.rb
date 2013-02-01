require 'test_helper'

class ContactersControllerTest < ActionController::TestCase
  setup do
    @contacter = contacters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contacter" do
    assert_difference('Contacter.count') do
      post :create, contacter: { addressRegion: @contacter.addressRegion, cellphoneNum: @contacter.cellphoneNum, company: @contacter.company, contactNum: @contacter.contactNum, contacterName: @contacter.contacterName, detailedAddress: @contacter.detailedAddress, email: @contacter.email, postalCode: @contacter.postalCode, validFlag: @contacter.validFlag }
    end

    assert_redirected_to contacter_path(assigns(:contacter))
  end

  test "should show contacter" do
    get :show, id: @contacter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contacter
    assert_response :success
  end

  test "should update contacter" do
    put :update, id: @contacter, contacter: { addressRegion: @contacter.addressRegion, cellphoneNum: @contacter.cellphoneNum, company: @contacter.company, contactNum: @contacter.contactNum, contacterName: @contacter.contacterName, detailedAddress: @contacter.detailedAddress, email: @contacter.email, postalCode: @contacter.postalCode, validFlag: @contacter.validFlag }
    assert_redirected_to contacter_path(assigns(:contacter))
  end

  test "should destroy contacter" do
    assert_difference('Contacter.count', -1) do
      delete :destroy, id: @contacter
    end

    assert_redirected_to contacters_path
  end
end
