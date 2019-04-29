# frozen_string_literal: true

FactoryBot.define do
  factory :patient_diagnostic_procedure do
    association :patient
    association :diagnostic_procedure
  end
end
