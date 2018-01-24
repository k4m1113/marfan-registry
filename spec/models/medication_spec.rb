require 'rails_helper'

describe Medication, type: :model do
  context 'with valid attributes' do
    let!(:medication) { FactoryBot.create :medication }

    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(medication).to be_valid
      end
    end

    describe 'Associations' do
      it { should belong_to :topic }
      it { should belong_to :patient }
    end

    describe '.generate_summary' do
      it 'begins with medication name' do
        expect(medication.generate_full_summary).to start_with 'losartan'
      end
      it 'ends with medication ingestion method' do
        expect(medication.generate_full_summary).to end_with '30 mg by mouth 2 times a day'
      end
    end

    describe '.medMapper.js' do
      it 'matches med topics' do
        expect(medication.topic.name).to eq medication.name
      end
      it 'displays parent topic name (med type)' do
        expect(medication.generate_full_summary).to match /an ARB/
      end
    end
  end
  context 'with invalid attributes' do
    let!(:no_name_medication) do
      FactoryBot.build :medication,
                         name: nil
    end

    let!(:no_ing_medication) do
      FactoryBot.build :medication,
                         ingestion_method: nil
    end

    let!(:no_top_medication) do
      FactoryBot.build :medication,
                         topic: nil
    end

    describe 'Validations' do
      it 'is invalid without ingestion method' do
        expect(no_name_medication).to_not be_valid
      end

      it 'is invalid without name' do
        expect(no_top_medication).to_not be_valid
      end
    end
  end
end
