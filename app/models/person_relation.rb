class PersonRelation < ActiveRecord::Base
  attr_accessible :type_id
  attr_accessible :updated_at, :created_at

  belongs_to :person
  belongs_to :children, :class_name => 'Person'

  attr_accessible :children
end
