# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :address do
    type_id :russian_passport
    sequence(:uri) { |i| "russian_passport/#{i}" }
    create_date DateTime.new(2001, 5, 6)
    update_date DateTime.new(2010, 8, 7)
    region_id '77000000000000'
    district_id '77000000000000'
    city_id '77000000000000'
    street_id '77000000001000'
    house 10
    building 3
    flat 114
  end
end
