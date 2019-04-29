# frozen_string_literal: true

FactoryBot.define do
  factory :admission_observation do
    association :admission
    association :observation
  end
end
