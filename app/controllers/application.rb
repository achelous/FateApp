# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  layout 'main'

  helper :all # include all helpers, all the time

  rescue_from ActiveRecord::RecordNotFound, :with => :bad_record
  rescue_from NoMethodError, :with => :generic_rescue

  def bad_record 
    generic_rescue("We couldn't find what you were looking for.") 
  end
  
  def generic_rescue(message="There's been an error in our system. This has been reported. We hope to fix this soon.")
    flash[:error] = "Oops! " + message 
    redirect_to :controller => :main, :action => :homepage
  end

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery #:secret => '5d573d45df3b78fa8846a7626b23e2bb'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
end
