# Topic.where(name: 'sibling')[0].id

FactoryGirl.define do
  factory :family_member do
    patient

    future_patient_data_hash {{
      "first_name" => "Anna",
      "last_name" => "Banana",
      "born_years_ago" => 30,
      "death_time_ago" => 1,
      "death_time_ago_scale" => "days",
      "deceased" => 1,
      "cause_of_death" => "aortic dissection",
      "note" => "Marfan"
    }}
    topic_id 3
  end
end
