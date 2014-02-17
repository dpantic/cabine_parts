require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe IpcboeingsController do

  # This should return the minimal set of attributes required to create a valid
  # Ipcboeing. As you add validations to Ipcboeing, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "ac_type" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # IpcboeingsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all ipcboeings as @ipcboeings" do
      ipcboeing = Ipcboeing.create! valid_attributes
      get :index, {}, valid_session
      assigns(:ipcboeings).should eq([ipcboeing])
    end
  end

  describe "GET show" do
    it "assigns the requested ipcboeing as @ipcboeing" do
      ipcboeing = Ipcboeing.create! valid_attributes
      get :show, {:id => ipcboeing.to_param}, valid_session
      assigns(:ipcboeing).should eq(ipcboeing)
    end
  end

  describe "GET new" do
    it "assigns a new ipcboeing as @ipcboeing" do
      get :new, {}, valid_session
      assigns(:ipcboeing).should be_a_new(Ipcboeing)
    end
  end

  describe "GET edit" do
    it "assigns the requested ipcboeing as @ipcboeing" do
      ipcboeing = Ipcboeing.create! valid_attributes
      get :edit, {:id => ipcboeing.to_param}, valid_session
      assigns(:ipcboeing).should eq(ipcboeing)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Ipcboeing" do
        expect {
          post :create, {:ipcboeing => valid_attributes}, valid_session
        }.to change(Ipcboeing, :count).by(1)
      end

      it "assigns a newly created ipcboeing as @ipcboeing" do
        post :create, {:ipcboeing => valid_attributes}, valid_session
        assigns(:ipcboeing).should be_a(Ipcboeing)
        assigns(:ipcboeing).should be_persisted
      end

      it "redirects to the created ipcboeing" do
        post :create, {:ipcboeing => valid_attributes}, valid_session
        response.should redirect_to(Ipcboeing.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ipcboeing as @ipcboeing" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ipcboeing.any_instance.stub(:save).and_return(false)
        post :create, {:ipcboeing => { "ac_type" => "invalid value" }}, valid_session
        assigns(:ipcboeing).should be_a_new(Ipcboeing)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Ipcboeing.any_instance.stub(:save).and_return(false)
        post :create, {:ipcboeing => { "ac_type" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested ipcboeing" do
        ipcboeing = Ipcboeing.create! valid_attributes
        # Assuming there are no other ipcboeings in the database, this
        # specifies that the Ipcboeing created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Ipcboeing.any_instance.should_receive(:update).with({ "ac_type" => "MyString" })
        put :update, {:id => ipcboeing.to_param, :ipcboeing => { "ac_type" => "MyString" }}, valid_session
      end

      it "assigns the requested ipcboeing as @ipcboeing" do
        ipcboeing = Ipcboeing.create! valid_attributes
        put :update, {:id => ipcboeing.to_param, :ipcboeing => valid_attributes}, valid_session
        assigns(:ipcboeing).should eq(ipcboeing)
      end

      it "redirects to the ipcboeing" do
        ipcboeing = Ipcboeing.create! valid_attributes
        put :update, {:id => ipcboeing.to_param, :ipcboeing => valid_attributes}, valid_session
        response.should redirect_to(ipcboeing)
      end
    end

    describe "with invalid params" do
      it "assigns the ipcboeing as @ipcboeing" do
        ipcboeing = Ipcboeing.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ipcboeing.any_instance.stub(:save).and_return(false)
        put :update, {:id => ipcboeing.to_param, :ipcboeing => { "ac_type" => "invalid value" }}, valid_session
        assigns(:ipcboeing).should eq(ipcboeing)
      end

      it "re-renders the 'edit' template" do
        ipcboeing = Ipcboeing.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Ipcboeing.any_instance.stub(:save).and_return(false)
        put :update, {:id => ipcboeing.to_param, :ipcboeing => { "ac_type" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested ipcboeing" do
      ipcboeing = Ipcboeing.create! valid_attributes
      expect {
        delete :destroy, {:id => ipcboeing.to_param}, valid_session
      }.to change(Ipcboeing, :count).by(-1)
    end

    it "redirects to the ipcboeings list" do
      ipcboeing = Ipcboeing.create! valid_attributes
      delete :destroy, {:id => ipcboeing.to_param}, valid_session
      response.should redirect_to(ipcboeings_url)
    end
  end

end
