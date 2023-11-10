require "rails_helper"

RSpec.describe "Users requests", type: :request do
  context "#create" do
    let(:user_attributes) { attributes_for(:user).merge(password: "password") }

    it "creates a user" do
      expect do
        post "/sign-up-or-in", params: { user: user_attributes }
      end.to change(User, :count).by(1)
    end
  end
end