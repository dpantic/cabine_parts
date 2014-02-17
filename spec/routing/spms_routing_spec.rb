require "spec_helper"

describe SpmsController do
  describe "routing" do

    it "routes to #index" do
      get("/spms").should route_to("spms#index")
    end

    it "routes to #new" do
      get("/spms/new").should route_to("spms#new")
    end

    it "routes to #show" do
      get("/spms/1").should route_to("spms#show", :id => "1")
    end

    it "routes to #edit" do
      get("/spms/1/edit").should route_to("spms#edit", :id => "1")
    end

    it "routes to #create" do
      post("/spms").should route_to("spms#create")
    end

    it "routes to #update" do
      put("/spms/1").should route_to("spms#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/spms/1").should route_to("spms#destroy", :id => "1")
    end

  end
end
