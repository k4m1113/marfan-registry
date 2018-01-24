require 'rails_helper'

describe Vital, type: :model do
  context 'with valid attributes' do

    let!(:vital) { FactoryBot.create :vital }

    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(vital).to be_valid
      end

      it 'is valid without visit' do
        vital.visit_id = nil
        expect(vital).to be_valid
      end
    end

    describe 'Associations' do
      it { should belong_to :topic }
      it { should belong_to :visit }
      it { should belong_to :patient }
    end

    describe '.generate_summary' do
      it 'finds pretty trail' do
        expect(vital.generate_summary).to match /height/
      end
    end

    describe '.concat_result' do
      it 'converts test amount to metric' do
        expect(vital.measurement.to_f).to eq ((72 * 2.54)/100).round(3)
      end
    end
  end
end
