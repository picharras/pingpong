class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, class_name: 'User', foreign_key: 'opponent_id'

  validates :user, presence: true
  validates :opponent_id, presence: true
  validates :user_score, presence: true
  validates :opponent_score, presence: true

  validate :validate_minimum_score, :on => :create
  validate :validate_score_difference, :on => :create

  private

  def validate_minimum_score
    if self.user_score < 11 && self.opponent_score < 11
      errors[:base] << 'At least a score should be greater than 11'
    end
  end

  def validate_score_difference
    score_difference = (self.user_score - self.opponent_score).abs
    some_score_is_21 = self.user_score > 20 || self.opponent_score > 20 ? true : false

    if score_difference < 2 && some_score_is_21 == false
      errors[:base] << 'There must be a difference of two points'        
    end
  end
end
