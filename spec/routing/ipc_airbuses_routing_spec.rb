require "spec_helper"

describe IpcAirbusesController do
  describe "routing" do

    it "routes to #index" do
      get("/ipc_airbuses").should route_to("ipc_airbuses#index")
    end

    it "routes to #new" do
      get("/ipc_airbuses/new").should route_to("ipc_airbuses#new")
    end

    it "routes to #show" do
      get("/ipc_airbuses/1").should route_to("ipc_airbuses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/ipc_airbuses/1/edit").should route_to("ipc_airbuses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/ipc_airbuses").should route_to("ipc_airbuses#create")
    end

    it "routes to #update" do
      put("/ipc_airbuses/1").should route_to("ipc_airbuses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/ipc_airbuses/1").should route_to("ipc_airbuses#destroy", :id => "1")
    end

  end
end
