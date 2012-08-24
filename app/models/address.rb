class Address < ActiveRecord::Base
  # belongs_to :russian_passport
  belongs_to :owner, :polymorphic => true, :touch => true

  attr_accessible :type_id
  attr_accessible :region_id,  :district_id, :city_id, :street_id, :house, :building, :flat
  attr_accessible :russian_passport_id
  attr_accessible :created_at, :updated_at
end
