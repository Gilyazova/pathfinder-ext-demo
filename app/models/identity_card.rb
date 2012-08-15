class IdentityCard < ActiveRecord::Base
  belongs_to :person, :touch => true
  belongs_to :extended_by, :polymorphic => true, :touch => true

  attr_accessible :person

  attr_accessible :serie, :number
  #
  # Тип докуметна удостоверяющего личность
  #
  attr_accessible :type
  #
  # Дата выдачи, Код подразделения, Кем выдан, Причина выдачи документа удостоверяющего личность,
  # Статус документа удостоверяющего личность, 
  #
  attr_accessible :issue_date, :issuer_code, :issuer, :reason, :state
  #
  # Дата утраты, Дата начала действия, Дата окончания действия
  #
end
