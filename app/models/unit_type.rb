class UnitType < ApplicationRecord
  validates :name, presence: true
  validates :note, presence: false

  normalizes :name, with: ->(e) { e.strip.downcase }

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end