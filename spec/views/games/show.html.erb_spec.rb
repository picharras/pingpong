require 'rails_helper'

RSpec.describe "games/show", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')
    @user2 = User.create!(email: 'pich2@gmail.com', password: 'secret12345')

    @game = assign(:game, Game.create!(
      :user => @user,
      :opponent_id => @user2.id,
      :user_score => 13,
      :opponent_score => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
