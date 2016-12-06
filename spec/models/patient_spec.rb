require 'rails_helper'

describe Patient do
  it { should have_valid(:first_name).when(nil, "", "John", "Jane") }

  it { should have_valid(:last_name).when(nil, "", "Doe", "O'Leary", "San Miguel") }

  it { should have_valid(:sex).when('F', 'M', 'N') }
  it { should_not have_valid(:sex).when('female', 'male', nil) }

  it { should have_valid(:deceased).when(true, false, nil) }

  it { should have_valid(:cause_of_death).when('Marfan', 'Natural causes', nil) }

  it { should have_valid(:address_line_1).when(nil, "", "123 Main Street") }

  it { should have_valid(:city).when(nil, "", "Chico", "San Francisco") }

  it { should have_valid(:state).when(nil, "", "CA", "ME") }
  it { should_not have_valid(:state).when(2.3) }

  it { should have_valid(:country).when(nil, "", "USA", "United States of America") }
  it { should_not have_valid(:country).when(2.7) }
end
