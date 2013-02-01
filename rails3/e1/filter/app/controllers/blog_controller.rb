#---
# Excerpted from "Agile Web Development with Rails, 3rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails3 for more book information.
#---


class BlogController < ApplicationController


  around_filter :time_an_action



  around_filter do |controller, action|
    started = Time.now
    action.call
    elapsed = Time.now - started
    controller.logger.info("#{controller.action_name} took #{elapsed} seconds")
  end     


  class TimingFilter
    def filter(controller)
      started = Time.now
      yield
      elapsed = Time.now - started
      controller.logger.info("#{controller.action_name} took #{elapsed} seconds")
    end
  end
  
  around_filter TimingFilter.new


  def index
    # ...
    render :text => "hello"
  end
  
  def bye
    # ...
    render :text => "goodbye"
  end
  
  private
  
  def time_an_action
    started = Time.now
    yield                
    elapsed = Time.now - started
    logger.info("#{action_name} took #{elapsed} seconds")
  end


end


