class StockEntry < ApplicationRecord
  validates :entry_at, presence: true

  has_many :stock_receipts, dependent: :destroy

  def product_quantities_summary
    stock_receipts.group_by { |sr| sr.product.name }.transform_values { |receipts| receipts.sum(&:quantity) }
  end
end