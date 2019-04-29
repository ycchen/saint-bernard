# frozen_string_literal: true

FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    middle_name { Faker::Name.middle_name }
    last_name { Faker::Name.last_name }
    mr { "MR-#{Faker::Number.number(10)}" }
    dob { Faker::Date.between(80.years.ago, Date.today) }
    gender { (0..2).to_a.sample }

    trait :with_admission do
      after(:create) do |patient|
        create :admission, :with_diagnosis, :with_symptom, :with_observation,
               patient: patient
      end
    end

    trait :with_allergies do
      after(:create) do |patient|
        2.times do
          allergy = create(:allergy)
          create :patient_allergy, patient: patient, allergy: allergy
        end
      end
    end

    trait :with_chronic_conditions do
      after(:create) do |patient|
        diagnosis = create(:diagnosis)
        create_list :chronic_condition, 2,
                    patient: patient,
                    diagnosis: diagnosis
      end
    end

    trait :with_medications do
      after(:create) do |patient|
        3.times do
          order_frequency = create(:order_frequency)
          medication_order = create(:medication_order,
                                    frequency: order_frequency)
          create :patient_medication,
                 patient: patient, medication_order: medication_order
        end
      end
    end

    trait :with_diagnostic_procedures do
      after(:create) do |patient|
        2.times do
          diagnostic_procedure = create(:diagnostic_procedure)
          create :patient_diagnostic_procedure,
                 patient: patient, diagnostic_procedure: diagnostic_procedure
        end
      end
    end

    trait :with_diagnoses do
      after(:create) do |patient|
        2.times do
          diagnosis = create(:diagnosis)
          create :patient_diagnosis, patient: patient, diagnosis: diagnosis
        end
      end
    end

    trait :with_treatments do
      after(:create) do |patient|
        2.times do
          treatment = create(:treatment)
          create :patient_treatment, patient: patient, treatment: treatment
        end
      end
    end
  end
end
