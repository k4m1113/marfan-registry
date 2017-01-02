require 'rails_helper'

describe Dissection do
  it { should belong_to(:patient) }

  it { should validate_presence_of(:patient) }
  it { should validate_presence_of(:concern_type) }
  it { should validate_presence_of(:when) }
  it { should validate_presence_of(:intervention) }
  it { should validate_presence_of(:location) }

  it { should have_valid(:concern_type).when("Cardiac") }
  it { should_not have_valid(:concern_type).when("Ocular", "Genetic", false, nil, -1) }

  it { should have_valid(:when).when(DateTime.now, DateTime.yesterday) }
  it { should_not have_valid(:when).when("now", -1, ) }

  it { should have_valid(:intervention).when("Surgery", "none") }
  it { should_not have_valid(:intervention).when(nil, -9, [])}
end
