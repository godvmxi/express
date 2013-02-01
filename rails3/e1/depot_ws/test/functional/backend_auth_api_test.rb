#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require File.dirname(__FILE__) + '/../test_helper' 
require 'backend_auth_controller'

class BackendAuthController
  def rescue_action(e)
    raise e
  end
end

class BackendAuthControllerApiTest < Test::Unit::TestCase
  fixtures :products

  def setup
    @controller = BackendAuthController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new 
  end

  def test_find_all_products
    result = invoke :find_all_products, 'secret'
    assert result[0].is_a?(Integer)
  end

  def test_find_product_by_id
    product = invoke :find_product_by_id, 'secret', 2
    assert_equal 'Product 2', product.description
  end
end
