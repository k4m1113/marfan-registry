require 'rails_helper'

describe Medication, type: :model do
  medication = FactoryGirl.create(:medication)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(medication).to be_valid
    end

    it "is invalid without ingestion method" do
      medication.ingestion_method = nil
      expect(medication).to_not be_valid
    end

    it "is invalid without name" do
      medication.topic_id = nil
      expect(medication).to_not be_valid
    end
  end

  describe "Associations" do
    it { should belong_to :topic }
    it { should belong_to :patient }
  end

  describe ".generate_summary" do
    summ = medication.generate_summary
    it "begins with medication name" do
      expect(summ).to start_with "losartan"
    end
    it "ends with medication ingestion method" do
      expect(summ).to end_with "30 mg by mouth 2 times a day"
    end
  end

  describe ".medMapper.js" do
    topic = Topic.find(medication.topic_id)
    summ = medication.generate_summary

    it "matches med topics" do
      expect(topic.name).to eq medication.name
    end
    it "displays parent topic name (med type)" do
      expect(summ).to match /an ARB/
    end
  end
end
