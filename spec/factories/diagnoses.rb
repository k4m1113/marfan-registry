osteoporosis = Topic.where(name: 'osteoporosis')[0]

FactoryGirl.define do
  factory :diagnosis do
    patient

    present false
    topic_id osteoporosis.id

    time_ago_amount nil
    time_ago_scale nil

    duration_amount nil
    duration_scale nil
  end
end
