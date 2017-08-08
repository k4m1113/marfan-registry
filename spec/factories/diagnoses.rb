# Topic.where(name: 'osteoporosis')[0].id

FactoryGirl.define do
  factory :diagnosis do
    patient

    present false
    topic_id 200

    time_ago_amount nil
    time_ago_scale nil

    duration_amount nil
    duration_scale nil
  end
end
