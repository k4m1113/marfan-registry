require 'rails_helper'
require 'date'
require 'application_helper'

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

    it 'is rejected if empty' do
      reject = FactoryGirl.build :diagnosis,
                                 present: nil,
                                 patient: nil

      expect { reject.save }.to raise_error
    end
  end

  describe 'Associations' do
    it { should belong_to :patient }
    it { should belong_to :topic }
  end

  describe '.generate_summary' do
    summ_diag = FactoryGirl.create :diagnosis

    summ = summ_diag.generate_summary

    it 'generates correct article' do
      expect(summ).to start_with 'an absence'
      summ_diag.present = 'presence'
      summ_2 = summ_diag.generate_summary
      expect(summ_2).to start_with 'a presence'
    end

    it 'finds pretty trail' do
      expect(summ).to include 'osteoporosis'
    end
  end

  describe '.generate_full_summary' do
    full_diag = FactoryGirl.create :diagnosis,
                                   time_ago_amount: 1,
                                   time_ago_scale: 'days',
                                   duration_amount: 1,
                                   duration_scale: 'day(s)',
                                   frequency_amount: 1,
                                   frequency_scale: 'year'

    summ_3 = full_diag.generate_full_summary

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
    time_diag = FactoryGirl.create :diagnosis,
                                   time_ago_amount: 1,
                                   time_ago_scale: 'days'

    it 'calculates absolute start date when applicable' do
      binding.remote_pry
      expect(time_diag.absolute_start_date.to_date).to eq Date.yesterday
      expect(time_diag.generate_full_summary).to include 'ago'
    end

    it 'defaults to created_at if no time ago specified' do
      expect(diagnosis.absolute_start_date.to_date).to eq Date.today
    end
  end

  describe '.concat_duration' do
    durat_diag = FactoryGirl.create :diagnosis,
                                    duration_amount: 1,
                                    duration_scale: 'day(s)'
    it 'concatenates duration' do
      expect(durat_diag.duration).to eq 'for 1 day(s)'
      expect(durat_diag.generate_full_summary).to include 'for'
    end

    it 'is blank if not specified' do
      expect(diagnosis.duration).to eq nil
    end
  end

  describe '.concat_frequency' do
    freq_diag = FactoryGirl.create :diagnosis,
                                   frequency_amount: 2,
                                   frequency_scale: 'year'
    it 'concatenates frequency' do
      expect(freq_diag.frequency).to eq '2 times per year'
      expect(freq_diag.generate_full_summary).to include 'per'
    end

    it 'is blank if not specified' do
      expect(diagnosis.frequency).to eq nil
    end
  end
end
