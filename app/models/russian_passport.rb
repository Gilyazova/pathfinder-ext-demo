class RussianPassport < ActiveRecord::Base
  has_one :identity_card, :as => :extended_by, :dependent => :destroy

  attr_accessible :first_name, :last_name, :middle_name, :birth_date

  delegate :person=, :to => :identity_card
  delegate :person, :to => :identity_card

  def initialize(*params)
    super
    self.identity_card = build_identity_card
  end
end
