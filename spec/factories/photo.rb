# -*- encoding: utf-8 -*-
FactoryGirl.define do
  factory :photo do
    sequence(:description) { |i| "Описание фотографии #{i}" }
  end
end
