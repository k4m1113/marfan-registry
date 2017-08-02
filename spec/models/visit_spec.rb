require 'rails_helper'

describe Visit, type: :model do
  visit = FactoryGirl.create(:visit)

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(visit).to be_valid
    end

    it { should validate_presence_of :patient_id }
    it { should validate_presence_of :clinician_id }
  end

  describe 'Associations' do
    it { should belong_to :clinician }
    it { should belong_to :patient }

    it { should have_many :diagnoses }
    it { should have_many :dissections }
    it { should have_many :family_members }
    it { should have_many :genetic_tests }
    it { should have_many :heart_measurements }
    it { should have_many :hospitalizations }
    it { should have_many :medications }
    it { should have_many :procedures }
    it { should have_many :tests }
    it { should have_many :vitals }
  end

  describe '.concerns' do

  end

  describe '.sort_by_topic' do

  end
end
