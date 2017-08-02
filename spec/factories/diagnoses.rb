FactoryGirl.define do
  factory :diagnosis do
    patient

    present false
    topic_id 200
  end
end
