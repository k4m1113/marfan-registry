require 'rails_helper'
require 'date'
require 'application_helper'

describe Diagnosis, type: :model do
  context 'with valid attributes' do
    let!(:diagnosis) do
      FactoryBot.create :diagnosis,
                         time_ago_amount: 1,
                         time_ago_scale: 'days',
                         duration_amount: 1,
                         duration_scale: 'day(s)',
                         frequency_amount: 1,
                         frequency_scale: 'year'
    end
    describe 'Validations' do
      it 'is valid with valid attributes' do
        expect(diagnosis).to be_valid
      end

      it 'is valid without visit' do
        diagnosis.visit_id = nil
        expect(diagnosis).to be_valid
      end

      it 'is rejected if empty' do
        reject = FactoryBot.build :diagnosis,
                                   present: nil,
                                   patient: nil

        expect { reject.save }.to raise_error ActiveRecord::NotNullViolation
      end
    end

    describe 'Associations' do
      it { should belong_to :patient }
      it { should belong_to :topic }
    end

    describe '.generate_summary' do
      it 'generates correct article' do
        summ = diagnosis.generate_summary
        expect(summ).to start_with 'an absence'
        diagnosis.present = true
        summ_2 = diagnosis.generate_summary
        expect(summ_2).to start_with 'a presence'
      end

      it 'finds pretty trail' do
        summ = diagnosis.generate_summary
        expect(summ).to include 'osteoporosis'
      end
    end

    describe '.generate_full_summary' do
      let(:summ_3) { diagnosis.generate_full_summary }

      it 'includes time ago' do
        expect(summ_3).to include '1 days ago'
      end

      it 'includes duration' do
        expect(summ_3).to include 'for 1 day(s)'
      end

      it 'includes frequency' do
        expect(summ_3).to include '1 times per year'
      end
    end

    describe '.concat_time_ago' do
      let(:empty_diag) { FactoryBot.create :diagnosis }
      it 'calculates absolute start date when applicable' do
        expect(diagnosis.absolute_start_date.to_date).to eq Date.yesterday
        expect(diagnosis.generate_full_summary).to include 'ago'
      end

      it 'defaults to created_at if no time ago specified' do
        expect(empty_diag.absolute_start_date.to_date).to eq Date.today
      end
    end

    describe '.concat_duration' do
      it 'concatenates duration' do
        expect(diagnosis.duration).to eq 'for 1 day(s)'
        expect(diagnosis.generate_full_summary).to include 'for'
      end
    end

    describe '.concat_frequency' do
      it 'concatenates frequency' do
        expect(diagnosis.frequency).to eq '1 times per year'
        expect(diagnosis.generate_full_summary).to include 'per'
      end
    end
  end
end
