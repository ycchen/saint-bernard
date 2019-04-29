# frozen_string_literal: true

FactoryBot.define do
  factory :diagnosis do
    coding_system { 'ICD-10' }
    code { "#{%w[A B].sample}#{Faker::Number.decimal_part(2)}" }
    description { Faker::Lorem.words(5, true).join(' ') }
  end
end
