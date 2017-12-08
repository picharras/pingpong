require 'rails_helper'

RSpec.describe "leadboards/index", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')

    assign(:leadboards, [
      Leadboard.create!(
        :user => @user,
        :score => 2,
        :games => 3
      ),
      Leadboard.create!(
        :user => nil,
        :score => 2,
        :games => 3
      )
    ])
  end

  it "renders a list of leadboards" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
