require 'rails_helper'

describe Patient do
  it { should have_valid(:first_name).when("John", "Jane") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Doe", "O'Leary", "San Miguel") }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:month_of_birth).when(12, 2) }
  it { should_not have_valid(:month_of_birth).when("Dec", nil, "", -1, 13) }

  it { should have_valid(:day_of_birth).when(1, 31, 28) }
  it { should_not have_valid(:day_of_birth).when("Mon", nil, "", -1, 32) }

  it { should have_valid(:year_of_birth).when(1992, 2016) }
  it { should_not have_valid(:year_of_birth).when(1899, 10000, nil, "", -1) }

  it { should have_valid(:sex).when('F', 'M', 'N') }
  it { should_not have_valid(:sex).when('female', 'male') }
end
