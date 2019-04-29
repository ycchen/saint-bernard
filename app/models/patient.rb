class Patient < ApplicationRecord
  enum gender: %i[male female other]

  belongs_to :facility
  has_one :admission

  has_many :chronic_conditions

  has_many :patient_allergies
  has_many :allergies, through: :patient_allergies

  has_many :patient_medications
  has_many :medications,
           through: :patient_medications, source: :medication_order

  has_many :patient_diagnostic_procedures
  has_many :diagnostic_procedures, through: :patient_diagnostic_procedures

  has_many :patient_diagnoses
  has_many :diagnoses, through: :patient_diagnoses

  has_many :patient_treatments
  has_many :treatments, through: :patient_treatments

  validates :first_name, presence: true
  validates :middle_name, presence: true
  validates :last_name, presence: true
  validates :mr, presence: true
  validates :dob, presence: true
  validates :gender, presence: true

  scope :ordered, -> { order(%i[last_name first_name middle_name]) }

  def self.with_everything(id)
    where(id: id)
        .includes(:allergies,
                  :diagnostic_procedures,
                  :diagnoses,
                  :treatments,
                  admission: [:diagnoses, :symptoms, :observations],
                  chronic_conditions: [:diagnosis],
                  medications: [:frequency]
        ).first
  end

  def name
    "#{last_name}, #{first_name} #{middle_initial}."
  end

  def date_of_birth
    dob.strftime('%B %d, %Y')
  end

  def age
    ((Time.zone.now - date_of_birth.to_time) / 1.year.seconds).floor.to_s
  end

  private

  def middle_initial
    middle_name.first
  end
end
