require "rails_helper"

RSpec.describe Pool, type: :model do
  context "relationships & validations" do
    before { create(:pool) }
    it { should belong_to :superadmin }
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of(:name).case_insensitive }

    context "start_datetime is in the future" do
      let(:pool) { build(:pool) }
      it "does not have errors when the date is in the future" do
        pool.start_datetime = 25.hours.from_now
        expect(pool.valid?).to eq(true)
        expect(pool.errors).to be_empty
      end

      it "has errors when the date is in the future" do
        pool.start_datetime = 23.hours.from_now
        expect(pool.valid?).to eq(false)
        expect(pool.errors.full_messages).to eq(["Start datetime must be greater than 24 hours in the future"])
      end
    end
  end
end
