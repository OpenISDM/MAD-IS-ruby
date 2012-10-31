class Facility < ActiveRecord::Base
  attr_accessible :addr, :lat, :lon, :name, :tel, :fac_type
  has_many :ratings
  
  def getUpdateParam
  	{:addr => self[:addr], :lat => self[:lat], :lon => self[:lon], :tel => self[:tel], :fac_type => self[:fac_type] }
  end

end
