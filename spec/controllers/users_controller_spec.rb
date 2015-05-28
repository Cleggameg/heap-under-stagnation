require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST create" do
    context "when valid params are passed" do
      it "creates a new User" do
        params = {username: "susan", email: "susan@susan.com", password: "12345"}
        user = User.new(params)
        user.save
        expect(user.id).to match(Integer)
      end

      it "assigns a newly created user as @user" do
        user = User.new(username: "Ted", email: "ted@ted.com", password: "12345")
        expect(User).to receive(:new).and_return(user)
        puts user.username
        user.save
        puts user.id
        post :create, :user => {username: "Ted", email: "ted@ted.com", password: "12345"}
        expect(assigns(:user).username).to eq(user.username)
      end

      it "redirects to the created user" do
        post :create, {:user => {username: "susan", email: "susan@susan.com", password: "12345"}}
        expect(response).to redirect_to("/login")
      end
    end
  end

  describe "#UPDATE" do
    it "can log a user in" do
      User.create(username:"sara", email:"sara@sara.com", password:"12345")
      session[:current_url] = "/questions"
      put :update, {:session => {email: "sara@sara.com", password: "12345"}}
      expect(response).to redirect_to("/questions")
    end
  end

  # describe "#DESTROY" do
  #   it "can log the user out" do
  #     request.env["HTTP_REFERER"] = "where_i_came_from"
  #     user = User.create(username:"sara", email:"sara@sara.com", password:"12345")
  #     # session[:user_id] = user.id
  #     session[:current_url] = "/questions"
  #     delete :destroy, {:session => {user_id: user.id} }
  #     expect(response).to redirect_to "where_i_came_from"
  #   end

  #   # it "assigns the requested user as @user" do
  #   #   delete :destroy, { id: user.to_param }
  #   #   expect(assigns(:user)).to eq(user)
  #   # end
  # end
end
