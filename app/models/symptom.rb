class Symptom < ApplicationRecord
  validates :description, presence: true
end
