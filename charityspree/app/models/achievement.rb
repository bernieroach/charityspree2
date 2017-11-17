class Achievement < ActiveRecord::Base
  has_many :user_achievements
  validates :title, presence: true
  validates :description, presence: true
end
