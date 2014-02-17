require "spec_helper"

describe IpcboeingsController do
  describe "routing" do

    it "routes to #index" do
      get("/ipcboeings").should route_to("ipcboeings#index")
    end

    it "routes to #new" do
      get("/ipcboeings/new").should route_to("ipcboeings#new")
    end

    it "routes to #show" do
      get("/ipcboeings/1").should route_to("ipcboeings#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ipcboeings/1/edit").should route_to("ipcboeings#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ipcboeings").should route_to("ipcboeings#create")
    end

    it "routes to #update" do
      put("/ipcboeings/1").should route_to("ipcboeings#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ipcboeings/1").should route_to("ipcboeings#destroy", :id => "1")
    end

  end
end
