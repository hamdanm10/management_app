class UnitType < ApplicationRecord
  validates :name, presence: true, length: { maximum: 25 }
  validates :note, presence: false

  normalizes :name, with: ->(e) { e.strip.downcase }

  has_many :ingredient_stocks, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end