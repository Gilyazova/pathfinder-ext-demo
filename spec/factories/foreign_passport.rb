# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :foreign_passport do
    sequence(:first_name) { |i| "Иван#{i}" }
    sequence(:last_name) { |i| "Иванов#{i}" }
    sequence(:middle_name) { |i| "Иванович" }

    sequence(:first_name_latin) { |i| "Ivan#{i}" }
    sequence(:last_name_latin) { |i| "Ivanov#{i}" }
  end
end
