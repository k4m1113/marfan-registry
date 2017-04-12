require 'rails_helper'
patient = FactoryGirl.create(:patient)
describe Patient, type: :model do
  it "is valid with valid attributes" do
    expect(patient).to be_valid

  end
  it "is invalid without full name" do

  end
  it { should have_valid(:first_name).when("John", "Jane") }
  it { should_not have_valid(:first_name).when(nil, "", 33) }

  it { should have_valid(:last_name).when("Doe", "O'Leary", "San Miguel") }
    it { should_not have_valid(:last_name).when(nil, "", 22) }

  it { should have_valid(:sex).when('F', 'M', 'N') }
  it { should_not have_valid(:sex).when('female', 'male', nil) }

  it { should have_valid(:deceased).when(true, false) }
  it { should_not have_valid(:deceased).when("", nil) }

  it { should have_valid(:cause_of_death).when('Marfan', 'Natural causes', nil) }

  it { should have_valid(:address_line_1).when("123 Main Street") }
  it { should_not have_valid(:address_line_1).when("", nil) }

  it { should have_valid(:city).when("Chico", "San Francisco") }
  it { should_not have_valid(:city).when("", nil, 557) }


  it { should have_valid(:state).when("CA", "ME") }
  it { should_not have_valid(:state).when(2.3) }

  it { should have_valid(:country).when("USA", "United States of America") }
  it { should_not have_valid(:country).when(2.7, nil, "") }

  it { should have_valid(:middle_name).when("Joey", "Bobby", "Janey", "Billy Joe", "", nil) }

  it { should have_valid(:email).when("kamille@kamille.kamille", "joe.schmo@gmail.com") }
  it { should_not have_valid(:email).when(nil, false, -9,) }

  it { should have_valid(:phone_1).when("18888888888", "1-999-999-9999") }
  it { should_not have_valid(:phone_1).when(nil, "") }
end
