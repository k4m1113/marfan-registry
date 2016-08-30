class SymptomsController < ApplicationController
  def index
    @symptoms = SeededSymptom.all
  end

  def new
    @visit = Visit.find(params[:id])
    @symptoms = SeededSymptom.all
  end

  def create
    @symptom = Symptom.new(symptom_params)

    if @symptom.save
      render json: @symptom
    else
      render json: @symptom.errors, status: :unprocessable_entity
    end
  end

  def update
    if @symptom.update(symptom_params)
      render json: @symptom
    else
      render json: @symptom.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @symptom.destroy
    head :no_content
  end

  private

  def symptom_params
    params.require(:symptom).permit(
      :seededsymptom_id,
      :presence,
      :measurement,
      :start_date,
      :frequency,
      :note)
  end

  def current_symptom
    @symptom = Symptom.find(params[:id])
  end
end
