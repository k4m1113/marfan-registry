FactoryGirl.define do
  factory :hospitalization do
    patient

    time_ago 1
    time_ago_scale "days"

    note "UCSF"
    topic_id 212
  end
end
