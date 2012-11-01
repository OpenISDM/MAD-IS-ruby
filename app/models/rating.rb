class Rating < ActiveRecord::Base
  attr_accessible :facility_id, :rate, :comment
  belongs_to :facility
end
