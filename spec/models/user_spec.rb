require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations & relationships" do
    before { create(:user) }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should have_many :pools }
    it { should have_many :memberships }
    it { should have_many :member_memberships }
    it { should have_many :member_pools }
    it { should have_many :admin_memberships }
    it { should have_many :admin_pools }
  end
end
