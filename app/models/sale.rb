class Sale < ApplicationRecord
  validates :sales_entry_id, presence: true
  validates :sales_channel_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :note, presence: false

  belongs_to :sales_entry
  belongs_to :sales_channel
  belongs_to :product

  has_one :sales_report, dependent: :destroy
end