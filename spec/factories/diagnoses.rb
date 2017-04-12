FactoryGirl.define do
  factory :diagnosis do
    patient

    note "absence"
    topic_id 21
  end
end
