class IngredientStock < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :unit_type_id, presence: true
  validates :note, presence: false

  belongs_to :unit_type

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end