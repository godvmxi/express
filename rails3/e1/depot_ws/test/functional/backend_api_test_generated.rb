#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper'
require 'backend_controller'

class BackendController; def rescue_action(e) raise e end; end

class BackendControllerApiTest < Test::Unit::TestCase
  def setup
    @controller = BackendController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  def test_find_all_products
    result = invoke :find_all_products
    assert_equal nil, result
  end

  def test_find_product_by_id
    result = invoke :find_product_by_id
    assert_equal nil, result
  end
end
