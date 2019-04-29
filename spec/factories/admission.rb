# frozen_string_literal: true

FactoryBot.define do
  factory :admission do
    moment { Time.zone.now }
    diagnoses { [] }
    symptoms { [] }
    observations { [] }

    trait :with_diagnosis do
      after(:create) do |admission|
        create :admission_diagnosis, admission: admission
      end
    end

    trait :with_symptom do
      after(:create) do |admission|
        create :admission_symptom, admission: admission
      end
    end

    trait :with_observation do
      after(:create) do |admission|
        create :admission_observation, admission: admission
      end
    end
  end
end
