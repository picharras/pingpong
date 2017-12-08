require 'rails_helper'

RSpec.describe Leadboard, type: :model do
  before do
    User.delete_all
    @user = User.create!(email: 'pichi@gmail.com', password: 'pass1234567')
  end

  let(:valid_attributes) {
    {
      user_id: @user.id,
      score: 14,
      games: 5
    }
  }

  let(:invalid_attributes) {
    {
      score: 'bar',
      games: 'foo'
    }
  }

  it 'should create a Leadboard object' do
    leadboard = Leadboard.new(valid_attributes)
    expect(leadboard.save).to be true
  end

  it 'should fail when try create a Leadboard with invalid score and games' do
    leadboard = Leadboard.new(invalid_attributes)
    expect(leadboard.save).to be false
  end
end
