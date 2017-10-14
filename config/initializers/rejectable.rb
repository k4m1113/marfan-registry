class ActiveSupport::HashWithIndifferentAccess
  def rejectable
    copy = clone
    copy.delete 'topic_id'
    copy.delete 'visit_id'
    copy.delete 'patient_id'
    copy.all? { |k, v| v.blank? || v.include?('null') }
  end
end
