# frozen_string_literal: true

FactoryBot.define do
  factory :treatment do
    description { Faker::Lorem.words(5).join(' ') }
    necessity { Faker::Lorem.words(5).join(' ') }
  end
end
