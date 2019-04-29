class AdmissionObservation < ApplicationRecord
  belongs_to :admission
  belongs_to :observation
end
