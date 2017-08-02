require 'rails_helper'
require 'date'

describe Hospitalization do
  hospitalization = FactoryGirl.create :hospitalization
  
  describe 'Associations' do
    it { should belong_to :patient }
    it { should belong_to :topic }
  end
end
