require 'rails_helper'

describe Diagnosis, type: :model do
  diagnosis = FactoryGirl.create :diagnosis

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(diagnosis).to be_valid
    end

    it 'is valid without visit' do
      diagnosis.visit_id = nil
      expect(diagnosis).to be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to :patient }
    it { should belong_to :topic }
  end

  describe '.generate_summary' do
    diagnosis = FactoryGirl.create :diagnosis

    summ = diagnosis.generate_summary
    it 'generates correct article' do
      expect(summ).to start_with 'an absence'
      diagnosis.present = 'presence'
      summ_2 = diagnosis.generate_summary
      expect(summ_2).to start_with 'a presence'
    end
    it 'finds pretty trail' do
      expect(summ).to include 'osteoporosis'
    end
  end
end
