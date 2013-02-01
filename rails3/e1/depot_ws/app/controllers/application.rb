#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---
# Application-wide functionality used by controllers.
#
# Also establishes Cart amd LineItem as models. This is necessary
# because these classes appear in sessions and hence have to be
# preloaded

class ApplicationController < ActionController::Base
  
  model :cart
  model :line_item

  private

  # Set the notice if a parameter is given, then redirect back
  # to the current controller's +index+ action
  def redirect_to_index(msg = nil)         #:doc:
    flash[:notice] = msg if msg
    redirect_to(:action => 'index')
  end

  # The #authorize method is used as a <tt>before_hook</tt> in
  # controllers that contain administration actions. If the
  # session does not contain a valid user, the method
  # redirects to the LoginController.login.
  def authorize                            #:doc:
    unless session[:user_id]
      flash[:notice] = "Please log in"
      redirect_to(:controller => "login", :action => "login")
    end
  end
end
