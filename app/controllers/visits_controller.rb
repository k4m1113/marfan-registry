require 'report'
require 'doctor'

class VisitsController < ApplicationController
  respond_to :html, :js
  include Report
  include Doctor

  def new
    @visit = Visit.new
    if params[:patient]
      @patient = Patient.find_by(id: params[:patient])
    end

    @all_symptoms = SeededSymptom.all
    @cardiac_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
    @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
    @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
    @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
    @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
    @integumentary_symptoms = SeededSymptom.where(systemic_category: "Integumentary")
    @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
    @feet_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
    @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
    @hand_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")

    @root_topics = Topic.roots
    @family_history = Topic.where(name: "family history")[0].self_and_descendants
    @genetics = Topic.where(name: "genetics")[0].self_and_descendants
    @medications = Topic.where(name: "medication")[0].self_and_descendants
    @cardio = Topic.where(name: "cardiovascular")[0].self_and_descendants
    @pulmonary = Topic.where(name: "pulmonary")[0].self_and_descendants
    @ortho = Topic.where(name: "orthopedic")[0].self_and_descendants
    @ophthalmo = Topic.where(name: "ophthalmologic")[0].self_and_descendants

    @symptoms = @visit.symptoms.build
    @hospitalizations = @visit.hospitalizations.build
    @family_member = @visit.family_members.build
    @tests = @visit.tests.build
    @dissections = @visit.dissections.build
    @meds = @visit.medications.build
  end

  def create
    @visit = Visit.new(visit_params)
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
    @cardiac_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
    @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
    @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
    @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
    @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
    @integumentary_symptoms = SeededSymptom.where(systemic_category: "Integumentary")
    @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
    @feet_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
    @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
    @hand_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")
  end

  def show
    @visit = Visit.find(params[:id])
    @patient = Patient.where(id:  @visit.patient_id)[0]
    @clinician = Clinician.where(id: @visit.clinician_id)[0]
    @dissections = Dissection.where(visit_id: @visit.id)
    @symptoms = Symptom.where(visit_id: @visit.id)
    @family_members = FamilyMember.where(visit_id: @visit.id)
    @tests = Test.where(visit_id: @visit.id)
    @hospitalizations = Hospitalization.where(visit_id: @visit.id)
  end

  def index
    @visits = Visit.all
    @cardiac_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
    @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
    @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
    @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
    @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
    @integumentary_symptoms = SeededSymptom.where(systemic_category: "Integumentary")
    @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
    @feet_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
    @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
    @hand_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")
  end

  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.where(id: @visit.patient_id)[0]
    @family = FamilyMember.where(visit_id: @visit.id)
    @family_member = @patient.family_members.build
    @hospitalizations = Hospitalization.where(visit_id: @visit.id)

    @mother = @family.where(seeded_relationship_type_id: 3)[0]
    @father = @family.where(seeded_relationship_type_id: 2)[0]
    @maternal_grandmother = @family.where(seeded_relationship_type_id: 7)[0]
    @paternal_grandmother = @family.where(seeded_relationship_type_id: 5)[0]
    @maternal_grandfather = @family.where(seeded_relationship_type_id: 6)[0]
    @paternal_grandfather = @family.where(seeded_relationship_type_id: 4)[0]
    @siblings = @family.where(seeded_relationship_type_id: 1)
    @children = @family.where(ahfnentafel_id: 16)
    @grandchildren = @family.where(ahfnentafel_id: 17)

    @all_symptoms = SeededSymptom.all
    @cardiac_symptoms = SeededSymptom.where(systemic_category: "Cardiovascular")
    @dural_symptoms = SeededSymptom.where(systemic_category: "Dural")
    @aural_symptoms = SeededSymptom.where(systemic_category: "Aural")
    @ocular_symptoms = SeededSymptom.where(systemic_category: "Ocular")
    @pulmonary_symptoms = SeededSymptom.where(systemic_category: "Pulmonary")
    @integumentary_symptoms = SeededSymptom.where(systemic_category: "Integumentary")
    @cranial_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Cranium)")
    @feet_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Feet & Legs)")
    @general_skeletal_symptoms = SeededSymptom.where(systemic_category: "Skeletal (General)")
    @hand_symptoms = SeededSymptom.where(systemic_category: "Skeletal (Hands & Arms)")

    @patient.symptoms.build
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

  def report
    # @visit = Visit.find(params[:id])
    # @clinician = Clinician.where(id: @visit.clinician_id)[0]
    # @first_symptom = @visit.symptoms.first
    # if @first_symptom
    #   @first_seeded_symptom = SeededSymptom.where(id: @first_symptom.seeded_symptom_id)[0]
    # end
    #
    # @first_family_member = @visit.relationships.first
    # @patient = Patient.where(id: @visit.patient_id)[0]
    #
    # @relevant_symptoms = []
    # @visit.symptoms.each do |s|
    #   @first_seeded_symptom_category = SeededSymptom.where(id: @first_symptom.seeded_symptom_id)[0].systemic_category
    #   if (SeededSymptom.where(id: s.seeded_symptom_id)[0].systemic_category == @first_seeded_symptom_category)
    #     @relevant_symptoms.push(s)
    #   end
    #   return @relevant_symptoms
    # end
    #
    #
    # if @patient.sex == "F"
    #   @she_he = "she"
    #   @his_her = "her"
    # else
    #   @she_he = "he"
    #   @his_her = "his"
    # end
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
      medications_attributes:
        [:visit_id, :patient_id, :topic_id, :dose, :dose_unit_of_measurement, :nested_med_id, :nested_med_category, :duration_amount, :duration_scale, :ingestion_method, :frequency, :frequency_scale, :common_name, :medication_format, :time_ago, :time_ago_scale, :absolute_start_date, :note],
      diagnoses_attributes:
        [:topic_id, :patient_id, :time_ago, :time_ago_scale, :absolute_start_date, :visit_id, :note],
      complications_attributes:
        [:topic_id, :patient_id, :time_ago, :time_ago_scale, :absolute_start_date, :visit_id, :note],
      procedures_attributes:
        [:topic_id, :patient_id, :clinician_id, :visit_id, :note],
      dissections_attributes:
        [:visit_id, :patient_id, :concern_type, :location, :extent, :when, :intervention, :complication, :note],
      family_members_attributes:
        [:visit_id, :patient_id, :topic_id, :seeded_relationship_type_id, :future_patient_data_hash, {future_patient_data_hash: [
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
