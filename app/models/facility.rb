class Facility < ApplicationRecord
  has_many :patients

  validates :name, presence: true

  scope :ordered, -> { order(:name) }
end
