class Facility < ActiveRecord::Base
  attr_accessible :addr, :lat, :lon, :name, :tel, :fac_type

  def to_s
    "#@name(#@tel)-#@lat, #@lon: #@addr"
  end

end
