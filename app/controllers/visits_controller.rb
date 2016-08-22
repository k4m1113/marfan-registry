class VisitsController < ApplicationController
  def new
    @visit = Visit.new
    @all_symptoms = SeededSymptom.all
    # @cardiovascular_symptoms = SeededSymptom.find(params[systemic_category: "Cardiovascular"])
    # @dural_symptoms =
    # @aural_symptoms =
    # @ocular_symptoms =
    # @pulmonary_symptoms =
    # @cranial_symptoms =
    # @feet_and_leg_symptoms =
    # @general_skeletal_symptoms =
    # @hand_and_arm_symptoms =
  end

  def create
    @visit = Visit.new(visit_params)
    if @visit.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def index
    @visits = Visit.all
  end

  private

  def visit_params
    params.require(:visit).permit(:height, :weight, :z_score,
    :arm_span, :upper_segment, :lower_segment, :patient_id)
  end
end
