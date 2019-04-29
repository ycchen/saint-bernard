# frozen_string_literal: true

FactoryBot.define do
  factory :admission_diagnosis do
    association :admission
    association :diagnosis
  end
end
