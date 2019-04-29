class MedicationOrder < ApplicationRecord
  enum unit: %i[mg]
  enum route: %i[PO IM SC]

  belongs_to :frequency, class_name: 'OrderFrequency'

  validates :name, presence: true
  validates :dosage, presence: true
  validates :necessity, presence: true
  validates :route, presence: true
  validates :unit, presence: true

  def to
    'to'
  end
end
