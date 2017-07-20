module EditVisitContent
  attr_reader :concerns, :sorted_concerns, :nested_scope, :clinician, :form_action, :jconcerns, :topics, :sorted_topics, :jvisit, :jpatient

  def edit_visit_content
    @concerns = @visit.sort_by_topic
    @sorted_concerns = @visit.sort_by_topic_then_type
    @jsorted_concerns = @sorted_concerns.to_json
    @nested_scope = @visit
    @clinician = Clinician.find(@visit.clinician_id)
    @form_action = "Update"
    # @visit.family_members.build
    # @visit.medications.build
    # @visit.diagnoses.build
    conc = []
    @visit.concerns.each do |obj|
      k = obj.as_json.merge!({summary: obj.generate_full_summary})
      conc << k
    end
    @jconcerns = conc.to_json
    @topics = Topic.all.reject{ |t| t.topic_type == 'middle' }.to_json
    @sorted_topics = Topic.roots.map { |t| [t.name, t.descendants.leaves.group_by(&:topic_type)] }.to_json
    @jvisit = @visit.as_json
    @jvisit.merge!({concerns: @jconcerns})
    @jvisit = @jvisit.to_json
    @jpatient = @patient.to_json
    @select2_patients = Patient.all.map { |t| { id: t.id, text: t.full_name } }.to_json
    @all_patients = Patient.all.to_json
    respond_to do |format|
      format.html
      format.json
    end
  end
end
