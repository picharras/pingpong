class Leadboard < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :score, numericality: true
  validates :games, numericality: true
end
