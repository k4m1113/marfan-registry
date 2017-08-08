require 'rails_helper'

describe Patient, type: :model do
  context 'with patient' do
    let(:patient) { FactoryGirl.create :patient }

    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(patient).to be_valid
      end

      it 'is invalid without full name' do
        should_not allow_value(nil).for :first_name
        should_not allow_value(nil).for :last_name
      end

      it 'is invalid without full address' do
        should validate_presence_of :address_line_1
        should validate_presence_of :city
        should validate_presence_of :state
        should validate_presence_of :postal_code
        should validate_presence_of :country

        should allow_value(nil).for :address_line_2
        should allow_value(nil).for :address_line_3
        should allow_value('123 Main Street').for :address_line_1
      end

      it 'is invalid without deceased status' do
        patient.address_line_1 = nil
        expect(patient).to_not be_valid
      end

      it 'is invalid without sex' do
        patient.sex = 'K'
        expect(patient).to_not be_valid

        should allow_value('F').for :sex
        should allow_value('M').for :sex
        should_not allow_value(nil).for :sex
        should_not allow_value(false).for :sex
        should_not allow_value(22).for :sex
      end

      it 'is invalid without @ email' do
        patient.email = nil
        expect(patient).to_not be_valid

        should allow_value('antoine@marfan.org').for :email
        should_not allow_value('not-an-email').for :email
        should_not allow_value(false).for :email
        should_not allow_value(22).for :email
      end

      it 'is invalid without primary phone' do
        no_phone = FactoryGirl.build :patient,
        phone_1: nil
        expect(no_phone).to_not be_valid
      end
    end

    describe 'Associations' do
      it { should have_many :diagnoses }
      it { should have_many :dissections }
      it { should have_many :family_members }
      it { should have_many :genetic_tests }
      it { should have_many :heart_measurements }
      it { should have_many :hospitalizations }
      it { should have_many :medications }
      it { should have_many :procedures }
      it { should have_many :tests }
      it { should have_many :visits }
      it { should have_many :vitals }
    end

    describe 'Pronouns' do
      describe '.subject_pronoun' do
        it 'is \'he\' when male' do
          patient.sex = 'M'
          expect(patient.subject_pronoun).to eq 'he'
        end
        it 'is \'she\' when female' do
          patient.sex = 'F'
          expect(patient.subject_pronoun).to eq 'she'
        end
        it 'is \'they\' when neither' do
          patient.sex = 'N'
          expect(patient.subject_pronoun).to eq 'they'
        end
      end

      describe '.object_pronoun' do
        it 'should be \'him\' when male' do
          patient.sex = 'M'
          expect(patient.object_pronoun).to eq 'him'
        end
        it 'should be \'her\' when female' do
          patient.sex = 'F'
          expect(patient.object_pronoun).to eq 'her'
        end
        it 'should be \'them\' otherwise' do
          patient.sex = 'N'
          expect(patient.object_pronoun).to eq 'them'
        end
      end

      describe '.possessive_pronoun' do
        it 'should be \'his\' when male' do
          patient.sex = 'M'
          expect(patient.possessive_pronoun).to eq 'his'
        end
        it 'should be \'her\' when female' do
          patient.sex = 'F'
          expect(patient.possessive_pronoun).to eq 'her'
        end
        it 'should be \'their\' if neither' do
          patient.sex = 'N'
          expect(patient.possessive_pronoun).to eq 'their'
        end
      end
    end

    describe 'Custom Methods' do
      describe '.age' do

      end

      describe '.full_name' do

      end

      describe '.sort_by_topic' do
        before(:each) do
          FactoryGirl.create :diagnosis,
          patient: patient
          FactoryGirl.create :procedure,
          patient: patient
          FactoryGirl.create :vital,
          patient: patient
          FactoryGirl.create :test,
          patient: patient
        end

        it 'should be of type Hash' do
          sorted = patient.sort_by_topic
          expect(sorted).to be_instance_of Hash
        end

        it 'should have symbols as keys' do
          sorted = patient.sort_by_topic
          expect(sorted.keys.first).to be_instance_of Symbol
        end

        it 'should have array of activerecord objects as values' do
          sorted = patient.sort_by_topic
          mri = sorted[:'neurologic concerns'][0]
          expect(sorted.values.first).to be_instance_of Array
          expect(mri.class).to be < ApplicationRecord
        end

        it 'should contain all body systems' do
          expect(patient.sort_by_topic.size).to eq Topic.roots.length
        end
      end
    end
  end
end
