require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    @game = assign(:game, Game.create!(
      :user => nil,
      :opponent_id => 1,
      :user_score => 1,
      :opponent_score => 1
    ))
  end

  it "renders the edit game form" do
    render

    assert_select "form[action=?][method=?]", game_path(@game), "post" do

      assert_select "input#game_user_id[name=?]", "game[user_id]"

      assert_select "input#game_opponent_id[name=?]", "game[opponent_id]"

      assert_select "input#game_user_score[name=?]", "game[user_score]"

      assert_select "input#game_opponent_score[name=?]", "game[opponent_score]"
    end
  end
end
