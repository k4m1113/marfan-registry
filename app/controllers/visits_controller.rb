require 'report'

class VisitsController < ApplicationController
  respond_to :html, :js
  include Report

  def new
    @visit = Visit.new

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

    @symptom = @visit.symptoms.build
    @hospitalization = @visit.hospitalizations.build
    @relationship_patient = Patient.new
    @relationship = @visit.relationships.build
    @test = @visit.tests.build
  end

  def create
    @visit = Visit.new(visit_params)
    @form_action = "Create"
    if @visit.save
      flash[:notice] = "Visit started for #{@visit.patient.last_name}, #{@visit.patient.first_name}."
      redirect_to edit_visit_path(@visit.id)
      session[:current_visit] = @visit
    else
      flash[:error] = "Please re-check information!"
      Rails.logger.info(@visit.errors.inspect)
      render :new
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
    @symptoms = @visit.symptoms
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
    @family = @visit.relationships
    @relationship = @visit.relationships.build
    @relationship_patient = Patient.where(id: @relationship.relationship_patient_id)[0]

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

    @visit.symptoms.build
    @form_action = "Update"
  end

  def update
    @visit = Visit.find(params[:id])
    @form_action = "Update"
    if @visit.update(visit_params)
      flash[:notice] = "Successfully updated visit!"
      redirect_to visits_path
    else
      Rails.logger.info(@visit.errors.inspect)
      flash[:error] = "Error updating visit."
      render :edit
    end
  end

  def destroy
    Visit.find(params[:id]).destroy
    redirect_to visits_path
  end

  def report
    @visit = Visit.find(params[:id])
    @clinician = Clinician.where(id: @visit.clinician_id)[0]
    @first_symptom = @visit.symptoms.first
    if @first_symptom
      @first_seeded_symptom = SeededSymptom.where(id: @first_symptom.seeded_symptom_id)[0]
    end

    @first_family_member = @visit.relationships.first
    @patient = Patient.where(id: @visit.patient_id)[0]

    @relevant_symptoms = []
    @visit.symptoms.each do |s|
      @first_seeded_symptom_category = SeededSymptom.where(id: @first_symptom.seeded_symptom_id)[0].systemic_category
      if (SeededSymptom.where(id: s.seeded_symptom_id)[0].systemic_category == @first_seeded_symptom_category)
        @relevant_symptoms.push(s)
      end
      return @relevant_symptoms
      binding.pry
    end


    if @patient.sex == "F"
      @she_he = "she"
      @his_her = "her"
    else
      @she_he = "he"
      @his_her = "his"
    end
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
      relationships_attributes:
        [:patient_id, :relationship_patient_id, :seeded_relationship_type_id, :visit_id, relationship_patients_attributes: [:first_name, :last_name, :sex, :deceased, :cause_of_death, :note]],
      hospitalizations_attributes:
        [:hospitalization, :visit_id, :admission_date, :length_of_stay, :hosp_type, :description, :location],
      tests_attributes:
        [:test, :visit_id, :test_type, :test_date, :result],
      symptoms_attributes:
        [:symptoms, :seeded_symptom_id, :visit_id, :presence, :measurement, :start_date, :frequency, :note])
  end
end
