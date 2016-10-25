require 'rails_helper'
require 'date'

describe Symptom do
  let!(:now) { DateTime.now }
  it { should have_valid(:seeded_symptom_id).when(1, 44) }
  it { should_not have_valid(:seeded_symptom_id).when(-1, false, nil, "") }

  it { should have_valid(:visit_id).when(1, 23) }

  it { should have_valid(:presence).when(true, false, nil) }

  it { should have_valid(:measurement).when(-1, 0, 1, 3.3, nil) }
  it { should_not have_valid(:measurement).when(true) }
end
