require 'rails_helper'

RSpec.describe "leadboards/show", type: :view do
  before(:each) do
    User.delete_all
    @user = User.create!(email: 'pich@gmail.com', password: 'secret12345')

    @leadboard = assign(:leadboard, Leadboard.create!(
      :user => @user,
      :score => 2,
      :games => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
