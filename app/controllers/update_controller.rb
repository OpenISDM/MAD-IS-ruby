class UpdateController < ApplicationController

  def index
    @message = params[:act]

    @allF = FacilitiesHelper::PoliceParser.instance.parse
    @allF.each do |x|
      if x.save
        @message << "Success!"
      else
        @message << "Fail"
      end
    end
    
  end
end
