class DeclarationIssue < ActiveRecord::Base
  #
  # Заявление на выдачу паспорта
  #
  belongs_to :identity_card
  belongs_to :source_identity_card

  attr_accessible :number, :date, :document_receive_date
end
