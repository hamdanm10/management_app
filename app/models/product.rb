class Product < ApplicationRecord
  validates :name, presence: true
  validates :cost_price, numericality: { greater_than: 0 }
  validates :selling_price, numericality: { greater_than: 0 }

  has_many :sales, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end