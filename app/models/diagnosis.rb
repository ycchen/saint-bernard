class Diagnosis < ApplicationRecord
  validates :coding_system, presence: true
  validates :code, presence: true
  validates :description, presence: true

  def described_code
    "#{description} (#{code})"
  end
end
