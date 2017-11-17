class User < ApplicationRecord
  has_many :user_achievments
  has_many :donations
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end
