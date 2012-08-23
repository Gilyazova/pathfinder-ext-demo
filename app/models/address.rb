class Address < ActiveRecord::Base
  belongs_to :russian_passport
  attr_accessible :type_id, :uri, :create_date, :update_date
  attr_accessible :region_id,  :district_id, :city_id, :street_id, :house, :building, :flat
  attr_accessible :russian_passport_id
end
