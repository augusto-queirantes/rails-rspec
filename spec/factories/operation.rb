# frozen_string_literal: true

FactoryBot.define do
  factory :operation do
    first_number { Faker::Number.within(range: 1..10) }
    second_number { Faker::Number.within(range: 1..10) }

    trait :plus do
      operation_type { 'plus' }
    end

    trait :minus do
      operation_type { 'minus' }
    end
  end
end
