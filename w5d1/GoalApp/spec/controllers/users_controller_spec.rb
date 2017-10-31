require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "New" do
    it "renders a sign up form" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "Create" do
    it "with invalid params it doesnt create a new user" do
      post :create, params: {user: {username: "user", password: "pord"}}
      expect(response).to render_template(:new)
      expect(User.all).to be_empty
    end

    it "with valid params it creates a new user" do
      post :create, params: {user: {username: "user1", password: "password"}}
      expect(response).to redirect_to(user_url(User.last))
      expect(User.last.username).to eq("user1")
    end
  end
end
