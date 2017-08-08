# Topic.where(name: 'height')[0].id

FactoryGirl.define do
  factory :vital do
    patient

    test_amount 72
    test_unit_of_meas 'in'
    topic_id 62
  end
end
