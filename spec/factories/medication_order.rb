# frozen_string_literal: true

FactoryBot.define do
  factory :medication_order do
    name { Faker::Dessert.variety }
    unit { :mg }
    dosage { Faker::Number.between(1, 6) }
    route { %i[PO IM SC].sample }
    association :frequency, factory: :order_frequency
    necessity { Faker::Lorem.words(5).join(' ') }
  end
end
