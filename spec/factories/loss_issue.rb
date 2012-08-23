# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :loss_issue do
    loss_date DateTime.new(2011, 5, 6)
    issue_date DateTime.new(2011, 7, 7)
    region_id '77000000000000'
    sequence(:loss_info) { "Сведения об утрате паспорта #{i}" }
    sequence(:issuer) { |i| "Исполнитель #{i}" }
  end
end
