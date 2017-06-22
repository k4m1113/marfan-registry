require 'report'
require 'json'
require 'pry-remote'

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
      k = obj.as_json.merge!({summary: obj.generate_summary})
      conc << k
    end
    @jconcerns = conc.to_json
    @topics = Topic.all.to_json
    @sorted_topics = Topic.roots.map { |t| [t.name, t.descendants] }.to_json
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
    binding.remote_pry
    if @visit.update(visit_params)
      visit_params.keys.each do |vp|
        flash[:success] = "Successfully updated visit with #{vp}"
      end
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

  def find_and_create_clinician(query)
    loc = Doctor.get_lat_and_long(@patient.city, @patient.state)
    @clinician = Doctor.find_doctors(query, loc)
    redirect_to new_visit_path(clinician: @clinician, patient: @patient)
  end

  private

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
      patient_attributes:
        %i[id primary_diagnosis],
      vitals_attributes:
        %i[visit_id patient_id topic_id vital test_amount sbp dbp test_unit_of_meas measurement note attachment],
      medications_attributes:
        %i[visit_id patient_id topic_id present dose dose_unit_of_measurement nested_med_id nested_med_category duration_amount duration_scale ingestion_method frequency frequency_scale common_name medication_format time_ago time_ago_scale absolute_start_date note name dosage_form dosage_form_units current attachment],
      diagnoses_attributes:
        [:visit_id, :topic_id, :patient_id, :present, :time_ago_amount, :time_ago_scale, :duration_amount, :duration_scale, :frequency_amount, :frequency_scale, :absolute_start_date, :note, :attachment, descriptors: []],
      procedures_attributes:
        [:topic_id, :patient_id, :clinician_id, :note, :attachment, :present, :time_ago_amount, :time_ago_scale, :absolute_start_date, descriptors: []],
      hospitalizations_attributes:
        %i[visit_id patient_id topic_id hospitalization admission_date time_ago time_ago_scale length_of_stay length_of_stay_scale hosp_type description location note attachment],
      family_members_attributes:
        [:visit_id, :patient_id, :topic_id, :future_patient_data_hash, :family_member, :attachment,  future_patient_data_hash:
          %i[first_name last_name born_years_ago date_of_birth deceased death_time_ago death_time_ago_scale death_date cause_of_death note],
      tests_attributes:
        %i[visit_id topic_id patient_id test test_date time_ago test_amount test_unit_of_meas time_ago_scale result note attachment]])
  end
end
