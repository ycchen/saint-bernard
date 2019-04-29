# frozen_string_literal: true

FactoryBot.define do
  factory :patient_medication do
    association :patient
    association :medication_order
  end
end
