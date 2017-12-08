require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')
    @user2 = User.create!(email: 'pich2@gmail.com', password: 'secret12345')

    assign(:game, Game.new(
      :user => @user,
      :opponent_id => @user2.id,
      :user_score => 14,
      :opponent_score => 12
    ))
  end

  it "renders new game form" do
    render

    assert_select "form[action=?][method=?]", games_path, "post" do

      assert_select "input#game_user_id[name=?]", "game[user_id]"

      assert_select "input#game_opponent_id[name=?]", "game[opponent_id]"

      assert_select "input#game_user_score[name=?]", "game[user_score]"

      assert_select "input#game_opponent_score[name=?]", "game[opponent_score]"
    end
  end
end
