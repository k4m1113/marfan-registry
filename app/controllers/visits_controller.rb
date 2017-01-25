require 'report'
require 'doctor'

class VisitsController < ApplicationController
  respond_to :html, :js
  include Report
  include Doctor

  before_filter :common_content

  def common_content
    @root_topics = Topic.roots
    @family_history = Topic.where(name: "family history")[0].self_and_descendants
    @genetics = Topic.where(name: "genetics")[0].self_and_descendants
    @medication = Topic.where(name: "medication")[0].self_and_descendants
    @cardiovascular = Topic.where(name: "cardiovascular")[0].self_and_descendants
    @pulmonary = Topic.where(name: "pulmonary")[0].self_and_descendants
    @ortho = Topic.where(name: "orthopedic")[0].self_and_descendants
    @ophthalmo = Topic.where(name: "ophthalmologic")[0].self_and_descendants

    @stats = Topic.where(topic_type: "stat")

    @root = Topic.where(parent_id: Topic.where(name: "aortic root")[0])
    @asc = Topic.where(parent_id: Topic.where(name: "ascending aortic")[0])
    @transv = Topic.where(parent_id: Topic.where(name: "transverse arch")[0])
    @desc = Topic.where(parent_id: Topic.where(name: "descending thoracic aorta")[0])
    @supra = Topic.where(parent_id: Topic.where(name: "suprarenal abdominal aorta")[0])
    @infra = Topic.where(parent_id: Topic.where(name: "infrarenal abdominal aorta")[0])
    @annulus = Topic.where(parent_id: Topic.where(name: "aortic annulus")[0])

    @heart_imaging_locations = [@root, @asc, @transv, @desc, @supra, @infra, @annulus]
  end

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
  end

  def index
    @visits = Visit.all
  end

  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient_id)
    @symptoms = Symptom.where(visit_id: @visit.id)
    @family_members = FamilyMember.where(visit_id: @visit.id)
    @vitals = Vital.where(visit_id: @visit.id)
    @tests = Test.where(visit_id: @visit.id)
    @imagery = @tests.where(topic_id: [@heart_imaging_locations].flatten)
    @tests -= @tests.where(id: @imagery)
    @hospitalizations = Hospitalization.where(visit_id: @visit.id)
    @procedures = Procedure.where(visit_id: @visit.id)
    @complications = Complication.where(visit_id: @visit.id)
    @diagnoses = Diagnosis.where(visit_id: @visit.id)
    @medications = Medication.where(visit_id: @visit.id)

    @form_action = "Update"
  end

  def update
    @visit = Visit.find(params[:id])
    @form_action = "Update"
    if @visit.update(visit_params)
      flash[:success] = "Successfully updated visit!"
      redirect_to visit_path(@visit.id)
    else
      Rails.logger.info(@visit.errors.inspect)
      flash[:error] = "Error updating visit: #{@visit.errors.full_messages}"
      redirect_to edit_visit_path(@visit.id)
    end
  end

  def destroy
    Visit.find(params[:id]).destroy
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
        :first_name, :last_name, :born_years_ago, :date_of_birth, :deceased, :cause_of_death, :note]}],
      hospitalizations_attributes:
        [:visit_id, :patient_id, :topic_id, :hospitalization, :admission_date, :time_ago, :time_ago_scale, :length_of_stay, :length_of_stay_scale, :hosp_type, :description, :location, :note],
      tests_attributes:
        [:visit_id, :topic_id,:patient_id, :test, :test_date, :time_ago, :time_ago_scale, :result, :note],
      symptoms_attributes:
        [:topic_id, :seeded_symptom_id, :patient_id, :visit_id, :symptoms, :presence, :measurement, :time_ago, :time_ago_scale, :start_date, :frequency, :note]
      )
  end
end
