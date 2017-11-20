class User < ApplicationRecord
  has_many :user_achievements
  has_many :donations
  has_secure_password
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
