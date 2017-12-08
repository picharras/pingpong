require 'rails_helper'

RSpec.describe "games/index", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')
    @user2 = User.create!(email: 'pich2@gmail.com', password: 'secret12345')

    assign(:games, [
      Game.create!(
        :user => @user,
        :opponent_id => @user2.id,
        :user_score => 14,
        :opponent_score => 12
      ),
      Game.create!(
        :user => @user,
        :opponent_id => @user2.id,
        :user_score => 14,
        :opponent_score => 12
      )
    ])
  end

  it "renders a list of games" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
