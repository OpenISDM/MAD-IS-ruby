class UpdateController < ApplicationController

  def index
    @message = params[:act]

    # Get all data
    @allF = FacilitiesHelper::SportCenterParser.instance.parse
    @allF << FacilitiesHelper::HospitalParser.instance.parse 
    @allF << FacilitiesHelper::SchoolParser.instance.parse 
    @allF << FacilitiesHelper::PoliceParser.instance.parse
    @allF.flatten!

    @stat = Array.new

    #Check whether to update, or add new entry
    @allF.each do |x|
      tmp = Facility.where("name = ?", x[:name])
      if tmp.size > 0
        unless tmp.first.getUpdateParam == x.getUpdateParam
          tmp.first.update_attributes(x.getUpdateParam)
          @stat << "Updated!"
        else
          @stat << "No Change"
        end 
      else
        @stat << (x.save ? "Saved" : "error")
      end
    end
    
  end
end
