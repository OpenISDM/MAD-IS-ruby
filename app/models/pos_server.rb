class PosServer < ActiveRecord::Base
  attr_accessible :ip, :lat, :lon, :region, :server_id
end
