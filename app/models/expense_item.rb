class ExpenseItem < ApplicationRecord
  validates :expense_id, presence: true
  validates :name, presence: true
  validates :unit_price, presence: true, numericality: { greater_than: 0 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :unit_type_id, presence: true
  validates :total_price, presence: true, numericality: { greater_than: 0 }
  validates :note, presence: false

  before_validation :calculate_total_price

  after_save :update_expense_total_price
  after_destroy :update_expense_total_price

  belongs_to :expense
  belongs_to :unit_type

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end

  private

  def calculate_total_price
    return unless unit_price && quantity
    self.total_price = unit_price * quantity
  end

  def update_expense_total_price
    total = expense.expense_items.sum(:total_price)
    expense.update_column(:total_price, total)
  end
end