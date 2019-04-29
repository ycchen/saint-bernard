# frozen_string_literal: true

FactoryBot.define do
  factory :admission_symptom do
    association :admission
    association :symptom
  end
end
