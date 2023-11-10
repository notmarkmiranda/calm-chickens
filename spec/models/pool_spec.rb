require "rails_helper"

RSpec.describe Pool, type: :model do
  context "relationships & validations" do
    before { create(:pool) }
    it { should belong_to :superadmin }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }
  end
end
