require 'rails_helper'

RSpec.describe "games/new", type: :view do
  before(:each) do
    assign(:game, Game.new(
      :user => nil,
      :opponent_id => 1,
      :user_score => 1,
      :opponent_score => 1
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
