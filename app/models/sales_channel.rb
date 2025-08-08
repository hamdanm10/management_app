class SalesChannel < ApplicationRecord
  validates :name, presence: true
  validates :note, presence: false

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end