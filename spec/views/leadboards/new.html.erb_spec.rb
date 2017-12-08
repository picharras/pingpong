require 'rails_helper'

RSpec.describe "leadboards/new", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')

    assign(:leadboard, Leadboard.new(
      :user => @user,
      :score => 1,
      :games => 1
    ))
  end

  it "renders new leadboard form" do
    render

    assert_select "form[action=?][method=?]", leadboards_path, "post" do

      assert_select "input#leadboard_user_id[name=?]", "leadboard[user_id]"

      assert_select "input#leadboard_score[name=?]", "leadboard[score]"

      assert_select "input#leadboard_games[name=?]", "leadboard[games]"
    end
  end
end
