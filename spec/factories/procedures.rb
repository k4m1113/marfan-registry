extraction = Topic.where(name: 'teeth extraction')[0]

FactoryGirl.define do
  factory :procedure do
    patient

    time_ago 1
    time_ago_scale 'years'

    note 'general anesthesia'
    topic_id extraction.id
  end
end
