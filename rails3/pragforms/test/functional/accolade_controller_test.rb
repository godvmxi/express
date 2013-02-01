#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'accolade_controller'

# Re-raise errors caught by the controller.
class AccoladeController; def rescue_action(e) raise e end; end

class AccoladeControllerTest < Test::Unit::TestCase
  fixtures :accolades

  def setup
    @controller = AccoladeController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_index
    get :index
    assert_response :success
    assert_template 'list'
  end

  def test_list
    get :list

    assert_response :success
    assert_template 'list'

    assert_not_nil assigns(:accolades)
  end

  def test_show
    get :show, :id => 1

    assert_response :success
    assert_template 'show'

    assert_not_nil assigns(:accolade)
    assert assigns(:accolade).valid?
  end

  def test_new
    get :new

    assert_response :success
    assert_template 'new'

    assert_not_nil assigns(:accolade)
  end

  def test_create
    num_accolades = Accolade.count

    post :create, :accolade => {}

    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_equal num_accolades + 1, Accolade.count
  end

  def test_edit
    get :edit, :id => 1

    assert_response :success
    assert_template 'edit'

    assert_not_nil assigns(:accolade)
    assert assigns(:accolade).valid?
  end

  def test_update
    post :update, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
  end

  def test_destroy
    assert_not_nil Accolade.find(1)

    post :destroy, :id => 1
    assert_response :redirect
    assert_redirected_to :action => 'list'

    assert_raise(ActiveRecord::RecordNotFound) {
      Accolade.find(1)
    }
  end
end
