class Observation < ApplicationRecord
  validates :description, presence: true
  validates :moment, presence: true
end
