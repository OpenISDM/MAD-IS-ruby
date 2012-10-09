class Facility < ActiveRecord::Base
  attr_accessible :addr, :lat, :lon, :name, :tel, :type
end
