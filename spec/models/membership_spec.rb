require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe "relationships & validaitons" do
    let(:role_values) { {'member': 0, 'admin': 1} }
    let(:status_values) { {'pending': 0, 'active': 1, 'archived': 2} }

    it { should belong_to :user }
    it { should belong_to :pool }
    it { should define_enum_for(:role).with_values(role_values) }
    it { should define_enum_for(:status).with_values(status_values) }
  end
end
