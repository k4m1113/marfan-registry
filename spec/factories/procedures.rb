# Topic.where(name: 'teeth extraction')[0].id

FactoryBot.define do
  factory :procedure do
    patient

    time_ago 1
    time_ago_scale 'years'

    note 'general anesthesia'
    topic_id 84
  end
end
