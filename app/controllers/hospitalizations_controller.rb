class HospitalizationsController < ApplicationController
  respond_to :html, :js

  def index
    @hospitalizations = Hospitalization.all
  end

  def show
    @hospitalization = Hospitalization.find(params[:id])
  end

  def new
    @hospitalization = Hospitalization.new
  end

  def create
    @hospitalization = Hospitalization.new(hospitalization_params)
    if @hospitalization.save
      flash[:success] = "Successfully added #{find_trail(print_if_present(@hospitalization.topic.name))}"
      redirect_to :back
    else
      flash[:danger] = "Please re-check information: #{@hospitalization.errors.full_messages}"
    end
  end

  def update
    @hospitalization = Hospitalization.find(params[:id])
    if @hospitalization.update(hospitalization_params)
      flash[:success] = "Successfully updated hospitalization #{find_trail(@procedure.topic_id)}"
      redirect_to session[:back_to] ||= request.referer
    else
      flash[:danger] = "Error updating hospitalization: #{@hospitalization.errors.full_messages}"
      redirect_to edit_hospitalization_path(@hospitalization.id)
    end
  end

  def destroy
    @hospitalization = Hospitalization.find(params[:id])
    @hospitalization.destroy
    flash[:success] = "Hospitalization #{@hospitalization.id} for #{find_trail(@hospitalization.topic_id)} deleted from record"
    redirect_to :back
  end

  private

  def hospitalization_params
    params.require(:hospitalization).permit(
    :patient_id,
    :visit_id,
    :topic_id,
    :admission_date,
    :length_of_stay,
    :length_of_stay_scale,
    :hosp_type,
    :description,
    :location,
    :time_ago,
    :time_ago_scale,
    :note)
  end

  def current_hospitalization
    @hospitalization = hospitalization.find(params[:id])
  end
end
