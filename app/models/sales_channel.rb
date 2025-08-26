class SalesChannel < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :note, presence: false

  has_many :sales, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
end