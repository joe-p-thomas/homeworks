require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "renders the new template" do
      get :new, {}
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with invalid params" do
      it "validates the presence of the user's username" do
        post :create, user: { name: "", password: "123456" }
        expect(flash[:errors]).not_to be_nil
      end
      it "validates the presence of the user's password" do
        post :create, user: { name: "JoeThomas", password: "" }
        expect(flash[:errors]).not_to be_nil
      end
      it "validates that the password is at least 6 characters long" do
        post :create, user: { name: "JoeThomas", password: "123" }
        expect(flash[:errors]).not_to be_nil
      end
    end

    context "with valid params" do
      it "redirects user to subs index on success" do
        post :create, user: { name: "JoeThomas", password: "123456" }
        expect(response).to redirect_to('/subs')
      end
    end
  end
end
