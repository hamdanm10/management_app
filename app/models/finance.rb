class Finance < ApplicationRecord
  validates :production_cost, presence: true
  validates :net_profit, presence: true
end