# frozen_string_literal: true

FactoryBot.define do
  factory :diagnostic_procedure do
    description { Faker::Lorem.words(5).join(' ') }
    moment { Time.zone.now }
  end
end
