require "rails_helper"

RSpec.describe "Memberships", type: :request do
  context "#create" do
    let!(:pool) { create(:pool) }
    before { login(pool.superadmin) }

    it "creates a membership & user when one does not exist" do
      expect do
        post "/pools/#{pool.id}/memberships", params: { membership: { pool_id: pool.id, user_attributes: { email: 'super@duper.com' } }}
      end.to change(Membership, :count).by(1)
      .and change(User, :count).by(1)
    end

    it "only creates a membership when user already exists" do
      user = create(:user)

      expect do
        post "/pools/#{pool.id}/memberships", params: { membership: { pool_id: pool.id, user_attributes: { email: user.email } }}
      end.to change(Membership, :count).by(1)
      .and change(User, :count).by(0)
    end
  end
end