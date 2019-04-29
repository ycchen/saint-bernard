class AdmissionSymptom < ApplicationRecord
  belongs_to :admission
  belongs_to :symptom
end
