
include FactoryBot::Syntax::Methods

5.times do
  create(:facility)
end

Facility.all.each do |facility|
  5.times do
    create(:patient,
           :with_admission,
           :with_allergies,
           :with_chronic_conditions,
           :with_medications,
           :with_diagnostic_procedures,
           :with_diagnoses,
           :with_treatments,
           facility: facility)
  end
end
