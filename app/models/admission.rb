class Admission < ApplicationRecord
  belongs_to :patient

  has_many :admission_diagnoses, dependent: :destroy
  has_many :diagnoses, through: :admission_diagnoses

  has_many :admission_symptoms, dependent: :destroy
  has_many :symptoms, through: :admission_symptoms

  has_many :admission_observations, dependent: :destroy
  has_many :observations, through: :admission_observations

  validates :moment, presence: true

  def date
    moment.strftime('%B %e, %Y')
  end

  def time
    moment.strftime('%l:%M %P').strip
  end
end
