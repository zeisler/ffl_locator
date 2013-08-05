require 'spec_helper'

describe DealersController do
  context "find_near" do
    before(:each) do
      get :find_near, coordinates: "45, -122"
    end
    it "finds nearest dealer from location" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "renders the find_near template" do
      expect(response).to render_template("find_near")
    end
  end
end
