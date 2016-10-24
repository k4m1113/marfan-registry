require 'rails_helper'

describe Hospitalization do
  it { should have_valid(:length_of_stay).when(1, 3, nil) }
  it { should_not have_valid(:length_of_stay).when(-1, false, "Seven") }
end
