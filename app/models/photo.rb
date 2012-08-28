class Photo < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true, :touch => true
  has_one :person
  attr_accessible :person

  attr_accessible :owner, :owner_type
  attr_accessible :description
end
