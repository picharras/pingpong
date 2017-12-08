class Game < ActiveRecord::Base
  belongs_to :user
  belongs_to :opponent, class_name: 'User', foreign_key: 'opponent_id'

  validates :user, presence: true
  validates :opponent_id, presence: true
  validates :user_score, presence: true
  validates :opponent_score, presence: true

  validate :validate_minimum_score, :on => :create
  validate :validate_score_difference, :on => :create

  after_create :update_leadboard

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

  def update_leadboard
    user_leadboard = self.user.leadboard
    opponent_leadboard = self.opponent.leadboard

    current_user_score = user_leadboard.score
    current_opponent_score = opponent_leadboard.score

    user_leadboard.games += 1
    opponent_leadboard.games += 1

    #When user wins
    if self.user_score > self.opponent_score
      if current_user_score > current_opponent_score
        user_leadboard.score += 1
      else
        user_leadboard.score += 3
      end
    end

    #When opponent wins
    if self.opponent_score > self.user_score
      if current_opponent_score > current_user_score
        opponent_leadboard.score += 1
      else
        opponent_leadboard.score += 3
      end
    end

    user_leadboard.save
    opponent_leadboard.save
  end
end
