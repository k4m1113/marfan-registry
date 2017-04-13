require 'rails_helper'

describe Test, type: :model do
  test = FactoryGirl.create(:test)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(test).to be_valid
    end

    it "is valid without visit" do
      test.visit_id = nil
      expect(test).to be_valid
    end
  end

  describe "Associations" do
    it { should belong_to :topic }
    it { should belong_to :visit }
    it { should belong_to :patient }
  end

  describe ".generate_summary" do
    summ = test.generate_summary
    it "finds pretty trail" do
      expect(summ).to match /MRI for dural ectasia/
    end
  end

  describe ".concat_result" do
    it "returns result with valid params" do
      expect(test.result).to eq "7 dural sac ratio"
    end
  end
end
