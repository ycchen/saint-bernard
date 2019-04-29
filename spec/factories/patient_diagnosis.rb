# frozen_string_literal: true

FactoryBot.define do
  factory :patient_diagnosis do
    association :patient
    association :diagnosis
  end
end
