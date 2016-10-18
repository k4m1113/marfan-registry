require 'rails_helper'

describe Hospitalization do
  it { should have_valid(:visit_id).when(1, 44) }
  it { should_not have_valid(:visit_id).when(-1, 4.4, nil, false, "one") }
  it { should have_valid(:length_of_stay).when(1, 3, nil) }
  it { should_not have_valid(:length_of_stay).when(-1, false, "Seven") }
end
