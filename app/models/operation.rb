class Operation < ApplicationRecord
  validates :first_number, :second_number, :operation_type, presence: true
  validates :first_number, :second_number, numericality: { greater_than_or_equal_to: 0 }

  enum operation_type: {
    plus: 'plus',
    minus: 'minus'
  }
end
