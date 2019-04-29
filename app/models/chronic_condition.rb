class ChronicCondition < ApplicationRecord
  belongs_to :patient
  belongs_to :diagnosis

  def described_code
    diagnosis.described_code
  end
end
