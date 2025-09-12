class SalesReport < ApplicationRecord
  validates :sale_id, presence: true
  validates :cost_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sold_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :unsold_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :revenue, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :grass_profit, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :loss, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :net_profit, presence: true
  validates :is_collected, inclusion: { in: [true, false] }

  validate :total_quantities_must_be_equal_to_sale_quantity

  before_validation :calculate_totals

  belongs_to :sale

  private

  def calculate_totals
    self.revenue = sold_quantity * selling_price.to_d
    self.grass_profit = ((selling_price.to_d - cost_price.to_d) * sold_quantity)
    self.loss = unsold_quantity * cost_price.to_d

    self.net_profit = is_collected ? (self.grass_profit - self.loss) : 0.to_d
  end

  def total_quantities_must_be_equal_to_sale_quantity
    total = sold_quantity + unsold_quantity
    
    if total != sale.quantity
      message = "must equal the total quantity of #{sale.quantity}."
      errors.add(:sold_quantity, message)
      errors.add(:unsold_quantity, message)
    end
  end
end