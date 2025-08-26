class SalesReport < ApplicationRecord
  validates :sale_id, presence: true
  validates :cost_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :selling_price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :sold_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :unsold_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :waste_quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :total_revenue, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_profit, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_loss, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :total_quantities_must_be_equal_to_sale_quantity

  before_validation :calculate_totals

  belongs_to :sale

  private

  def calculate_totals
    self.total_revenue = sold_quantity * selling_price.to_f
    self.total_profit  = ((selling_price.to_f - cost_price.to_f) * sold_quantity)
    self.total_loss    = waste_quantity * cost_price.to_f
  end

  def total_quantities_must_be_equal_to_sale_quantity
    total = sold_quantity + unsold_quantity + waste_quantity
    
    if total != sale.quantity
      message = "must equal the total quantity of #{sale.quantity}."
      errors.add(:sold_quantity, message)
      errors.add(:unsold_quantity, message)
      errors.add(:waste_quantity, message)
    end
  end
end