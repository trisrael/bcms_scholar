# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  before_filter :setup_dynamic_stylesheets

  #Get the StyleSheet content_blocks from the database and make them accessible to the helpers
  def setup_dynamic_stylesheets
   if Rails.env.equals? 'development'
    @stylesheet_content_arr = StyleSheet.all
   end 
  end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
