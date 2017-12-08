class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :trackable, :validatable

  has_one :leadboard
  has_many :games

  after_create :create_leadboard

  def games
    Game.where('user_id = ? OR opponent_id = ?', self.id, self.id)
  end

  private

  def create_leadboard
    Leadboard.create(user_id: self.id, score: 0, games: 0)
  end
end
