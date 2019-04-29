# frozen_string_literal: true

FactoryBot.define do
  factory :patient_allergy do
    association :patient
    association :allergy
  end
end
