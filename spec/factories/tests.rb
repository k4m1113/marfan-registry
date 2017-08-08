# Topic.where(name: 'MRI for dural ectasia')[0].id

FactoryGirl.define do
  factory :test do
    patient

    test_amount 7
    test_unit_of_meas 'dural sac ratio'
    topic_id 273

    present true
    time_ago 3
    time_ago_scale 'years'
  end
end
