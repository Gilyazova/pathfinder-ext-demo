class IdentityCard < ActiveRecord::Base
  belongs_to :person, :touch => true
  belongs_to :extended_by, :polymorphic => true, :touch => true

  has_one :declaration_issue
  has_one :loss_issue

  # source_identity_card

  attr_accessible :person

  attr_accessible :serie, :number
  #
  # Тип докуметна удостоверяющего личность
  #
  attr_accessible :type_id
  #
  # Дата выдачи, Код подразделения, Кем выдан, Причина выдачи документа удостоверяющего личность,
  # Статус документа удостоверяющего личность, 
  #
  attr_accessible :issue_date, :issuer_code, :issuer, :reason_id, :state_id
  #
  # Дата утраты, Дата начала действия, Дата окончания действия
  #
  attr_accessible :loss_date, :start_date, :finish_date
  #
  # Код региона выдачи
  #
  attr_accessible :issue_place_code

  def identity_card_name
    self.extended_by.class.name.underscore
  end
end
