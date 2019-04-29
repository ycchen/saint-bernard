# frozen_string_literal: true

FactoryBot.define do
  factory :patient_treatment do
    association :patient
    association :treatment
  end
end
