class VisitsController < ApplicationController
  respond_to :html, :js

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
    @visit.symptoms.build
  end

  def create
    @visit = Visit.new(visit_params)
    @form_action = "Create"
    if @visit.save
      redirect_to :action => :index
      session[:current_visit] = @visit
      case @visit.general_health
      when "Poor"
      when "Fair"

      when "Good"

      when "Excellent"

      end

    else
      Rails.logger.info(@visit.errors.inspect)
      render :new
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def index
    @visits = Visit.all
  end

  def edit
    @visit = Visit.find(params[:id])
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
      flash[:notice] = "Successfully updated visit"
      redirect_to visits_path
    else
      Rails.logger.info(@visit.errors.inspect)
      render :edit
    end
  end

  def destroy
    Visit.find(params[:id]).destroy
    redirect_to visits_path
  end

  private

  def visit_params
    params.require(:visit).permit(
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
      symptoms_attributes:
        [:symptoms, :seeded_symptom_id, :visit_id, :presence, :measurement, :start_date, :frequency, :note])
  end
end
