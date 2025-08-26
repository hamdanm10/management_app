class StockReceipt < ApplicationRecord
  validates :stock_entry_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :note, presence: false

  belongs_to :stock_entry
  belongs_to :product

  def self.ransackable_attributes(auth_object = nil)
    []
  end

  def self.ransackable_associations(auth_object = nil)
    ["product"]
  end
end