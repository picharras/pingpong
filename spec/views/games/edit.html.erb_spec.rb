require 'rails_helper'

RSpec.describe "games/edit", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')
    @user2 = User.create!(email: 'pich2@gmail.com', password: 'secret12345')

    @game = assign(:game, Game.create!(
      :user => @user,
      :opponent_id => @user2.id,
      :user_score => 14,
      :opponent_score => 12
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
