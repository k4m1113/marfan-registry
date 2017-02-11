require 'report'
require 'doctor'
require 'json'
require 'pry'

class VisitsController < ApplicationController
  include Report
  include Doctor

  respond_to :html, :js
  before_filter :common_content

  def new
    @visit = Visit.new
    if params[:patient]
      @patient = Patient.find_by(id: params[:patient])
    end

    @visit.vitals.build
    @visit.symptoms.build
    @visit.hospitalizations.build
    @visit.family_members.build
    @visit.tests.build
    @visit.medications.build
    @visit.diagnoses.build
  end

  def create
    @visit = Visit.new(visit_params)
    @patient = Patient.find(@visit.patient_id)
    @form_action = "Create"
    if @visit.save
      flash[:success] = "Visit started for #{@visit.patient.last_name}, #{@visit.patient.first_name}."
      redirect_to edit_visit_path(@visit.id)
      session[:current_visit] = @visit
    else
      flash[:error] = "Please re-check information: #{@visit.errors.full_messages}"
      Rails.logger.info(@visit.errors.inspect)
      render 'new'
      @visit = session[:current_visit]
    end
  end

  def show
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient_id)
    @clinician = Clinician.find(@visit.clinician_id)
    @symptoms = Symptom.where(visit_id: @visit.id)
    @family_members = FamilyMember.where(visit_id: @visit.id)
    @vitals = Vital.where(visit_id: @visit.id)
    @tests = Test.where(visit_id: @visit.id)
    @imagery = @tests.where(topic_id: [ @heart_imaging_locations].flatten)
    @tests -= @tests.where(id: @imagery)
    @hospitalizations = Hospitalization.where(visit_id: @visit.id)
    @diagnoses = Diagnosis.where(visit_id: @visit.id)
  end

  def index
    @visits = Visit.all
  end

  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient_id)

    @family_members = FamilyMember.where(patient_id: @patient.id)
    @children = @patient.family_members.select{ |relation| relation['topic_id'] === @child.id}
    @siblings = @patient.family_members.select{ |relation| relation['topic_id'] === @sibling.id}
    @parents = @patient.family_members.select{ |relation| relation['topic_id'] === @parent.id}

    @visits = Visit.where(patient_id: @patient.id).order("id ASC")
    if (@visits.length > 1 && @visit === @visits.last)
      @previous_visit = @visits[-0]
    end
    @nested_scope = @visit
    @clinician = Clinician.find(@visit.clinician_id)
    unless @visits.length == 0
      @primary_clinician = Clinician.where(id: @visits[0].clinician_id)[0]
    end
    @form_action = "Update"
    @visit.family_members.build
  end

  def update
    @visit = Visit.find(params[:id])
    @form_action = "Update"
    if @visit.update(visit_params)
      visit_params.keys.each do |vp|
        flash[:success] = "Successfully updated visit with #{vp}"
      end
      redirect_to edit_visit_path(@visit.id)
    else
      Rails.logger.info(@visit.errors.inspect)
      flash[:error] = "Error updating visit: #{@visit.errors.full_messages}"
      redirect_to edit_visit_path(@visit.id)
    end
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
      vitals_attributes:
        [:visit_id, :patient_id, :topic_id, :vital, :measurement, :note],
      medications_attributes:
        [:visit_id, :patient_id, :topic_id, :dose, :dose_unit_of_measurement, :nested_med_id, :nested_med_category, :duration_amount, :duration_scale, :ingestion_method, :frequency, :frequency_scale, :common_name, :medication_format, :time_ago, :time_ago_scale, :absolute_start_date, :note],
      diagnoses_attributes:
        [:topic_id, :patient_id, :time_ago, :time_ago_scale, :absolute_start_date, :visit_id, :note],
      complications_attributes:
        [:topic_id, :patient_id, :time_ago, :time_ago_scale, :absolute_start_date, :visit_id, :note],
      procedures_attributes:
        [:topic_id, :patient_id, :clinician_id, :visit_id, :note],
      family_members_attributes:
        [:visit_id, :patient_id, :topic_id, :future_patient_data_hash, {future_patient_data_hash: [
        :first_name, :last_name, :born_years_ago, :date_of_birth, :deceased, :death_time_ago, :death_time_ago_scale, :death_date, :cause_of_death, :note]}],
      hospitalizations_attributes:
        [:visit_id, :patient_id, :topic_id, :hospitalization, :admission_date, :time_ago, :time_ago_scale, :length_of_stay, :length_of_stay_scale, :hosp_type, :description, :location, :note],
      tests_attributes:
        [:visit_id, :topic_id,:patient_id, :test, :test_date, :time_ago, :time_ago_scale, :result, :note],
      symptoms_attributes:
        [:topic_id, :patient_id, :visit_id, :symptoms, :presence, :measurement, :time_ago, :time_ago_scale, :start_date, :frequency, :note]
      )
  end
end
