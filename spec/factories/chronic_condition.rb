# frozen_string_literal: true

FactoryBot.define do
  factory :chronic_condition do
    association :patient
    association :diagnosis
  end
end
