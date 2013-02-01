#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  def setup
    @request.cookies[SESSION_KEY] = "faux session"
  end

  test "existing functional tests should continue to work" do
    get :hello
    assert_response :success
  end

  test "when cookies are disabled a redirect results" do
    @request.cookies.delete SESSION_KEY
    get :hello
    assert_response :redirect
    assert_equal 'http://test.host/store/cookies_test', redirect_to_url
  end
end
