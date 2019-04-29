class OrderFrequency < ApplicationRecord
  enum frequency_unit: %i[hour]

  validates :value, presence: true
  validates :frequency_unit, presence: true

  def to_s
    "q#{value}hr"
  end
end
