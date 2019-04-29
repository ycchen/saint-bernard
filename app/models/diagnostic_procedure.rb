class DiagnosticProcedure < ApplicationRecord
  validates :description, presence: true
  validates :moment, presence: true

  def on
    'on'
  end

  def at
    'at'
  end
end
