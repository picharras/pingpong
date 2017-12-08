require 'rails_helper'

RSpec.describe "Leadboards", type: :request do
  describe "GET /leadboards" do
    it "works! (now write some real specs)" do
      get leadboards_path
      expect(response).to have_http_status(200)
    end
  end
end
