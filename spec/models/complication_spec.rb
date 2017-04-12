require 'rails_helper'

describe Complication, type: :model do
  complication = FactoryGirl.create(:complication)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(complication).to be_valid
    end

    it "is valid without visit" do
      complication.visit_id = nil
      expect(complication).to be_valid
    end

    it "is invalid without note" do
      complication.note = nil
      expect(complication).to_not be_valid
    end

  end

  describe "Associations" do
    it { should belong_to :patient }
    it { should belong_to :topic }
  end

  describe ".generate_summary" do
    summ = complication.generate_summary
    it "generates correct article" do
      expect(summ).to start_with 'a presence'
      complication.note = 'absence'
      summ_2 = complication.generate_summary
      expect(summ_2).to start_with 'an absence'
    end
    it "finds pretty trail" do
      expect(summ).to match /perfused true lumen right iliac aortic dissection/
    end
  end
end
