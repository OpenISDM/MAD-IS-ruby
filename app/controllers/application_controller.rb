class ApplicationController < ActionController::Base
  protect_from_forgery

  def handle_unverified_request
	apiKey = params[:apikey]

	unless apiKey == "andrewLai"
	  raise ActionController::InvalidAuthenticityToken
  	end
  end

end
