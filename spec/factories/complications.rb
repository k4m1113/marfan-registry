FactoryGirl.define do
  factory :complication do
    patient

    note "presence"
    topic_id 212
  end
end
