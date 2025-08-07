class UnitType < ApplicationRecord
  validates :name, presence: true
  validates :note, presence: false
end