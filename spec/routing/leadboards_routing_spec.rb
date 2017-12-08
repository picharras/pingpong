require "rails_helper"

RSpec.describe LeadboardsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/leadboards").to route_to("leadboards#index")
    end

    it "routes to #show" do
      expect(:get => "/leadboards/1").to route_to("leadboards#show", :id => "1")
    end
  end
end
