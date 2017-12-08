require 'rails_helper'

RSpec.describe Game, type: :model do
  before do
    User.delete_all
    @user = User.create!(email: 'pichi@gmail.com', password: 'pass1234567')
    @user2 = User.create!(email: 'pichi2@gmail.com', password: 'pass1234567')
  end

  let(:valid_attributes) {
    {
      user_id: @user.id,
      opponent_id: @user2.id,
      user_score: 14,
      opponent_score: 12
    }
  }

  let(:invalid_attributes) {
    {
      user_id: @user.id,
      opponent_id: @user2.id,
      user_score: 9,
      opponent_score: 8
    }
  }

  it 'should create a Game object' do
    game = Game.new(valid_attributes)
    expect(game.save).to be true
  end

  it 'should fail when try create a Game with invalid score' do
    game = Game.new(invalid_attributes)
    expect(game.save).to be false
  end
end
