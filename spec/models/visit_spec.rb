require 'rails_helper'

describe Visit do
  it { should have_valid(:patient_id).when(1, 999999) }
  it { should_not have_valid(:patient_id).when(nil, "", 0, -1, "1", "One", 1.3, 1.03) }

  it { should have_valid(:height).when(1, 182, 182.04, 182.1) }
  it { should_not have_valid(:height).when(nil, "", 0, -1, "One") }

  it { should have_valid(:weight).when(1, 200, 57.3, 57.01) }
  it { should_not have_valid(:weight).when(nil, "", 0, -1, "One") }

  it { should have_valid(:z_score).when(1, 4.3, 5.74) }
  it { should_not have_valid(:patient_id).when(nil, "", 0, -1, "One") }

  it { should have_valid(:upper_segment).when(1, 80.0, 80.00) }
  it { should_not have_valid(:upper_segment).when(nil, "", -1, "One") }

  it { should have_valid(:lower_segment).when(1, 80.0, 80.01) }
  it { should_not have_valid(:lower_segment).when(nil, "", -1, "One") }

  it { should have_valid(:arm_span).when(1, 182.3, 180.09) }
  it { should_not have_valid(:arm_span).when(nil, "", 0, -1, "One") }
end
