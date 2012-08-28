class Person < ActiveRecord::Base
  has_many :identity_cards

  has_many :relations, :class_name => 'PersonRelation'
  has_many :photos
end
