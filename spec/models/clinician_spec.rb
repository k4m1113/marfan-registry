require 'rails_helper'

describe Clinician do
  it { should have_valid(:first_name).when("David", "Sunny") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith", "O'Leary", "San Miguel") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:practice_name).when("Stanford Hospital", "Boston Marfan Clinic") }
  it { should_not have_valid(:practice_name).when(nil, 22) }

  it { should have_valid(:address_line_1).when("123 Main Street") }
  it { should_not have_valid(:address_line_1).when(nil) }

  it { should have_valid(:city).when("Chico", "San Francisco") }
  it { should_not have_valid(:city).when(nil, 55) }

  it { should have_valid(:state).when("CA", "ME") }
  it { should_not have_valid(:state).when(nil, 222) }

  it { should have_valid(:country).when("USA", "United States of America") }
  it { should_not have_valid(:country).when(nil, 222) }
end
