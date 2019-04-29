# frozen_string_literal: true

FactoryBot.define do
  factory :allergy do
    description { Faker::Dessert.topping }
  end
end
