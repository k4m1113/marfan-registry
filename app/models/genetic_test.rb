class GeneticTest < ApplicationRecord
  include ApplicationHelper
  mount_uploader :attachment, AttachmentUploader

  before_save :timeify

  attr_accessor :time_ago_amount, :time_ago_scale, :absolute_start_date, :present

  belongs_to :topic
  belongs_to :visit, inverse_of: :genetic_tests, required: false
  belongs_to :patient, inverse_of: :genetic_tests

  def generate_summary

  end

  def timeify
    if absolute_start_date.blank? && (!time_ago_amount.blank? && !time_ago_scale.blank?)
      dat = find_date(time_ago_amount, time_ago_scale, Date.today)
    else
      dat = created_at
    end
    self.date = dat
  end

  def self.table_headings
    %w[Date Location Pathogenicity Type Note Attachment Actions]
  end

  def table_body
    action_view = ActionView::Base.new(Rails.configuration.paths["app/views"])
    action_view.class_eval do
      include Rails.application.routes.url_helpers
      include ApplicationHelper

      def protect_against_forgery?
        false
      end
    end

    return {
      'date': print_if_present(self.date),
      'location': print_if_present(company),
      'pathogenicity': print_if_present(pathogenicity),
      'type': print_if_present(test_type),
      'note': print_if_present(note),
      'attachment': "#{action_view.render(
        partial: 'layouts/attachment_thumbnails', format: :txt,
        locals: { model: self })}".html_safe,
      'actions': "#{action_view.render(
        partial: 'genetic_tests/link_buttons', format: :txt,
        locals: { t: self})}".html_safe
    }
  end
end
