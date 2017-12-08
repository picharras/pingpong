require 'rails_helper'

RSpec.describe "leadboards/edit", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')

    @leadboard = assign(:leadboard, Leadboard.create!(
      :user => @user,
      :score => 1,
      :games => 1
    ))
  end

  it "renders the edit leadboard form" do
    render

    assert_select "form[action=?][method=?]", leadboard_path(@leadboard), "post" do

      assert_select "input#leadboard_user_id[name=?]", "leadboard[user_id]"

      assert_select "input#leadboard_score[name=?]", "leadboard[score]"

      assert_select "input#leadboard_games[name=?]", "leadboard[games]"
    end
  end
end
