class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @all_symptoms = SeededSymptom.all
    @visit.symptoms.build
  end

  def create
    @visit = Visit.new(visit_params)
    @form_action = "Create"
    @all_symptoms = SeededSymptom.all
    if @visit.save
      redirect_to :action => :index
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
  end

  def update
    @visit = Visit.find(params[:id])
    @form_action = "Update"
    if @visit.update(visit_params)
      flash[:notice] = "Successfully updated visit"
      redirect_to visit_path(@visit)
    else
      flash[:alert] = "You are not allowed to edit this visit"
      render :edit
    end
  end

  private

  def visit_params
    params.require(:visit).permit(
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
