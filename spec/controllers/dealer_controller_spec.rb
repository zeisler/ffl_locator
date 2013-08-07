require 'spec_helper'

describe DealersController do
  context "find_near" do
    before(:each) do
      get :find_near, coordinates: "45, -122"
    end
    it "will render the page" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "renders the find_near template" do
      expect(response).to render_template("find_near")
    end
  end
  context "index" do
    before(:each) do
      get :index
    end
    it "will render the page" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
     it "renders the index template" do
      expect(response).to render_template("index")
    end
  end
  context "directory" do
    before(:each) do
      get :directory
    end
    it "will render the page" do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    it "renders the directory template" do
      expect(response).to render_template("directory")
    end
  end
end
