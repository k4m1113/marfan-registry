class Dissection < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  # attr_reader :table_headings, :table_body
  # attr_accessor :time_ago_amount, :time_ago_scale, :duration_amount, :duration_scale, :frequency_amount, :frequency_scale, :descriptors

  has_many :topics
  belongs_to :visit, inverse_of: :dissections, required: false
  belongs_to :patient, inverse_of: :dissections

  def generate_summary

  end

  has_one :location
  has_one :perfusion
  has_one :lumen
  has_one :direction
end
