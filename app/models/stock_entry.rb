class StockEntry < ApplicationRecord
  validates :entry_at, presence: true
end