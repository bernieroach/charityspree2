class Donation < ActiveRecord::Base
  belongs_to :charity
  belongs_to :user
  validates :quantity, presence: true
end
