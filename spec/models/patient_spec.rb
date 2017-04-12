require 'rails_helper'

describe Patient, type: :model do
  patient = FactoryGirl.create(:patient)

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(patient).to be_valid
    end

    it "is invalid without full name" do
      patient.first_name = nil
      expect(patient).to_not be_valid
    end

    it "is invalid without full address" do
      should validate_presence_of :address_line_1
      should validate_presence_of :city
      should validate_presence_of :state
      should validate_presence_of :postal_code
      should validate_presence_of :country

      should allow_value(nil).for(:address_line_2)
      should allow_value(nil).for(:address_line_3)
      should allow_value("123 Main Street").for(:address_line_1)
    end

    it "is invalid without deceased status" do
      patient.address_line_1 = nil
      expect(patient).to_not be_valid
    end

    it "is invalid without sex" do
      patient.sex = 'K'
      expect(patient).to_not be_valid

      should allow_value("F").for(:sex)
      should allow_value("M").for(:sex)
      should_not allow_value(nil).for(:sex)
      should_not allow_value(false).for(:sex)
      should_not allow_value(22).for(:sex)
    end

    it "is invalid without @ email" do
      patient.email = nil
      expect(patient).to_not be_valid

      should allow_value("antoine@marfan.org").for(:email)
      should_not allow_value("not-an-email").for(:email)
      should_not allow_value(false).for(:email)
      should_not allow_value(22).for(:email)
    end

    it "is invalid without primary phone" do
      expect(FactoryGirl.build(:patient, phone_1: nil)).to_not be_valid
      expect(FactoryGirl.build(:patient, phone_1: "")).to_not be_valid
    end
  end

  describe "Associations" do

  end

  describe ".subject_pronoun" do
    it "should be 'he' when male" do
      patient.sex = 'M'
      expect(patient.subject_pronoun).to eq('he')
    end
    it "should be 'she' when female" do
      patient.sex = 'F'
      expect(patient.subject_pronoun).to eq('she')
    end
    it "should be 'they' when neither" do
      patient.sex = 'N'
      expect(patient.subject_pronoun).to eq('they')
    end
  end

  describe ".object_pronoun" do
    it "should be 'him' when male" do
      patient.sex = 'M'
      expect(patient.object_pronoun).to eq('him')
    end
    it "should be 'her' when female" do
      patient.sex = 'F'
      expect(patient.object_pronoun).to eq('her')
    end
    it "should be 'them' otherwise" do
      patient.sex = 'N'
      expect(patient.object_pronoun).to eq('them')
    end
  end

  describe ".possessive_pronoun" do
    it "should be 'his' when male" do
      patient.sex = 'M'
      expect(patient.possessive_pronoun).to eq('his')
    end
    it "should be 'her' when female" do
      patient.sex = 'F'
      expect(patient.possessive_pronoun).to eq('her')
    end
    it "should be 'their' if neither" do
      patient.sex = 'N'
      expect(patient.possessive_pronoun).to eq('their')
    end
  end
end
