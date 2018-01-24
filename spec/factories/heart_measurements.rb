# Topic.where(name: 'aortic root')[0].id

FactoryBot.define do
  factory :heart_measurement do
    patient

    time_ago 1
    time_ago_scale 'years'

    test_amount 3.3
    test_unit_of_meas 'cm'

    descriptors 'general anesthesia'
    topic_id 100
  end
end
