class SymptomsController < ApplicationController
  def index
    @symptoms = Symptom.all
  end

  def show
    @symptom = Symptom.find(params[:id])
  end

  def new
    @symptom = Symptom.new
  end

  def edit
    @symptom = Symptom.find(params[:id])
    @patient = @symptom.patient
  end

  def create
    @symptom = Symptom.new(symptom_params)
    if @symptom.save
      flash[:success] = "#{find_trail(print_if_present(@symptom.topic.name))}"
      redirect_to :back
    else
      flash[:error] = "Please re-check information: #{@symptom.errors.full_messages}"
    end
  end

  def update
    @symptom = Symptom.find(params[:id])
    @form_action = "Update"
    if @symptom.update(symptom_params)
      flash[:success] = "Successfully updated symptom #{find_trail(@symptom.topic_id)}"
      redirect_to :back
    else
      flash[:error] = "Error updating procedure: #{@procedure.errors.full_messages}"
      redirect_to edit_procedure_path(@procedure.id)
  end

  def destroy
    @symptom.destroy
    flash[:success] = "Symptom #{@symptom.id} for #{find_trail(@symptom.topic_id)} deleted from record."
    redirect_to :back
  end

  private

  def symptom_params
    params.require(:symptom).permit(
      :patient_id,
      :topic_id,
      :visit_id,
      :presence,
      :measurement,
      :start_date,
      :frequency,
      :time_ago,
      :time_ago_scale,
      :note)
  end

  def current_symptom
    @symptom = Symptom.find(params[:id])
  end
end
