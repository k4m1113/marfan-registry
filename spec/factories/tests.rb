FactoryGirl.define do
  factory :test do
    result 77
    topic_id 99

    patient_id 1

    time_ago 3
    time_ago_scale "years"

    note "negative"
  end
end
