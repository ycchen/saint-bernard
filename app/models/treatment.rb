class Treatment < ApplicationRecord
  validates :description, presence: true
  validates :necessity, presence: true

  def to
    'to'
  end
end
