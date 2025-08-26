class SalesEntry < ApplicationRecord
  validates :sale_code, presence: true, uniqueness: true
  validates :sale_at, presence: true

  before_validation :generate_sale_code

  has_many :sales, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["sale_code"]
  end

  private

  def generate_sale_code
    return if sale_at.blank?
    self.sale_code = "SAL/#{self.sale_at.strftime('%d%m%Y')}/#{SecureRandom.hex(2).upcase}"
  end
end