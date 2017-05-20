class Gallery < ApplicationRecord
  mount_uploaders :attachments, AttachmentUploader # mount the uploaders
  belongs_to :visit,
    inverse_of: :gallery,
    required: false
  belongs_to :test,
    inverse_of: :gallery,
    required: false
  # belongs_to :symptom,
  #   inverse_of: :gallery,
  #   required: false
  belongs_to :procedure,
    inverse_of: :gallery,
    required: false
  belongs_to :patient,
    inverse_of: :gallery,
    required: false
  belongs_to :medication,
    inverse_of: :gallery,
    required: false
  belongs_to :hospitalization,
    inverse_of: :gallery,
    required: false
  belongs_to :family_member,
    inverse_of: :gallery,
    required: false
  belongs_to :diagnosis,
    inverse_of: :gallery,
    required: false
end
