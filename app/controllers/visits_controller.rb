require 'report'
require 'json'
# require 'pry-remote'

# visits controller
class VisitsController < ApplicationController
  include Report
  include Doctor
  include CommonContent

  respond_to :html, :js

  before_action :common_content

  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient.id)
    @clinician = Clinician.find(@visit.clinician_id)
    @family_members = family_members = FamilyMember.where(visit_id: @visit.id)
    @vitals = vitals = Vital.where(visit_id: @visit.id)
    @tests = tests = Test.where(visit_id: @visit.id)
    @imagery = imagery = @tests.find_all{|t| Topic.where(topic_type: 'heart_measurement').collect(&:id).include?(t.topic_id) }
    @tests = tests -= @imagery
    @hospitalizations = hospitalizations = Hospitalization.where(visit_id: @visit.id)
    @diagnoses = diagnoses = Diagnosis.where(visit_id: @visit.id)
  end

  def new
    @visit = Visit.new
    @patient = Patient.find_by(id: params[:patient]) if params[:patient]

    @visit.vitals.build
    @visit.hospitalizations.build
    @visit.family_members.build
    @visit.tests.build
    @visit.medications.build
    @visit.diagnoses.build
    @nested_scope = @visit
  end

  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient.id)

    @family_members = FamilyMember.where(patient_id: @patient.id)
    @children = @patient.family_members.select { |r| r['topic_id'] == @child.id }
    @siblings = @patient.family_members.select { |r| r['topic_id'] == @sibling.id }
    @parents = @patient.family_members.select { |r| r['topic_id'] == @parent.id }

    @tests = tests = Test.where(visit_id: @visit.id)
    @imagery = imagery = @tests.find_all{|t| Topic.where(topic_type: 'heart_measurement').collect(&:id).include?(t.topic_id) }
    @tests = tests -= @imagery

    @visits = Visit.where(patient_id: @patient.id).order('id ASC')
    if (@visits.length > 1) && (@visit == @visits.last)
      @previous_visit = @visits[-0]
      @primary_clinician = @visits.first.clinician
    end
    @concerns = @visit.sort_by_topic
    @sorted_concerns = @visit.sort_by_topic_then_type
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
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @visit = Visit.new(visit_params)
    @patient = Patient.find(@visit.patient.id)
    full_name = "#{@patient.last_name}, #{@patient.first_name}"
    @form_action = 'Create'
    if @visit.save
      flash[:success] = "Visit started for #{full_name}."
      redirect_to edit_visit_path(@visit.id)
      session[:current_visit] = @visit
    else
      flash[:error] = "Please re-check values: #{@visit.errors.full_messages}"
      Rails.logger.info(@visit.errors.inspect)
      render 'new'
      @visit = session[:current_visit]
    end
  end

  def update
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient.id)
    @form_action = 'Update'
    # binding.remote_pry
    if @visit.update(visit_params)
      # visit_params.keys.each do |vp|
      #   flash[:success] = "Successfully updated visit with #{vp}"
      # end
    else
      Rails.logger.info(@visit.errors.inspect)
      flash[:error] = "Error updating visit: #{@visit.errors.full_messages}"
    end
    redirect_to edit_visit_path(@visit.id)
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to visits_path
  end

  private

  def diagnoses_attributes
    Diagnosis.attributes
  end

  def dissections_attributes
    Dissection.attributes
  end

  def family_members_attributes
    FamilyMember.attributes
  end

  def genetic_tests_attributes
    GeneticTest.attributes
  end

  def heart_measurements_attributes
    HeartMeasurement.attributes
  end

  def hospitalizations_attributes
    Hospitalization.attributes
  end

  def medications_attributes
    Medication.attributes
  end

  def patient_attributes
    %i[id primary_diagnosis]
  end

  def procedures_attributes
    Procedure.attributes
  end

  def tests_attributes
    Test.attributes
  end

  def vitals_attributes
    Vital.attributes
  end

  def visit_params
    params.require(:visit).permit(
      :id,
      :general_health,
      :height,
      :weight,
      :z_score,
      :arm_span,
      :upper_segment,
      :lower_segment,
      :patient_id,
      :clinician_id,
      :primary_reason,
      :secondary_reason,
      :vital,
      :test,
      dissections_attributes: dissections_attributes,
      family_members_attributes: family_members_attributes,
      genetic_tests_attributes: genetic_tests_attributes,
      hospitalizations_attributes: hospitalizations_attributes,
      medications_attributes: medications_attributes,
      patient_attributes: patient_attributes,
      tests_attributes: tests_attributes,
      vitals_attributes: vitals_attributes,
      diagnoses_attributes: diagnoses_attributes,
      heart_measurements_attributes: heart_measurements_attributes,
      procedures_attributes: procedures_attributes
    )
  end
end
