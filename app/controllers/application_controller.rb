class ApplicationController < ActionController::Base
  protect_from_forgery

  def handle_unverified_request
	#add here code to empty the session
	apiKey = params[:apikey]
	if apiKey != "andrewLai"
	  raise ActionController::InvalidAuthenticityToken
  	end
  end
end
