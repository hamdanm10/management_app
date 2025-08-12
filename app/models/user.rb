class User < ApplicationRecord
  has_secure_password

  enum :user_type, { super_admin: 0, admin: 1 }, default: :admin 

  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  def full_name
    "#{first_name} #{last_name}"
  end
end
