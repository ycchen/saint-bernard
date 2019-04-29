# frozen_string_literal: true

FactoryBot.define do
  factory :symptom do
    description { Faker::Lorem.words(5).join(' ') }
  end
end
