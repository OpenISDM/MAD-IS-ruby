class Rating < ActiveRecord::Base
  attr_accessible :facility_id, :rate
  belongs_to :facility
end
