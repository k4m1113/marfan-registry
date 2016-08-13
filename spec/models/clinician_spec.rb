require 'rails_helper'

describe Clinician do
  it { should have_valid(:first_name).when("David", "Sunny") }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when("Smith", "O'Leary", "San Miguel") }
  it { should_not have_valid(:last_name).when(nil, "") }

end
