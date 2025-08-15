class Expense < ApplicationRecord
  validates :expense_at, presence: true
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :expense_items, dependent: :destroy
end