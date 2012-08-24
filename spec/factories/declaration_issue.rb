# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :declaration_issue do
    sequence(:number) { |i| "number #{i}" }

    date DateTime.new(2001, 5, 6)
    document_receive_date DateTime.new(2001, 4, 6)
  end
end
