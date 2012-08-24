class LossIssue < ActiveRecord::Base

  belongs_to :identity_card

  attr_accessible :loss_date, :issue_date, :region_id, :loss_info, :issuer
end
