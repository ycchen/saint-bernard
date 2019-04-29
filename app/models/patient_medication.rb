class PatientMedication < ApplicationRecord
  belongs_to :patient
  belongs_to :medication_order
end
