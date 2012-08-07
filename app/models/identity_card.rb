class IdentityCard < ActiveRecord::Base
  belongs_to :person, :touch => true
  belongs_to :extended_by, :polymorphic => true, :touch => true

  attr_accessible :person
end
