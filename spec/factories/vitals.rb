height = Topic.where(name: 'height')[0]

FactoryGirl.define do
  factory :vital do
    patient

    test_amount 72
    test_unit_of_meas 'in'
    topic_id height.id
  end
end
