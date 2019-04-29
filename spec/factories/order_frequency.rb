# frozen_string_literal: true

FactoryBot.define do
  factory :order_frequency do
    value { %w[2 3 4 6 8 12 24].sample }
    frequency_unit { :hour }
  end
end
