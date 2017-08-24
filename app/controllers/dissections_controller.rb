class DissectionsController < ApplicationController
  respond_to :html, :js

  def index
    @dissections = Dissection.all
  end

  def show
    @dissection = Dissection.find(params[:id])
  end

  def new
    @dissection = Dissection.new
  end

  def edit
    @dissection = Dissection.find(params[:id])
  end

  def create
    @dissection = Dissection.new(dissection_params)
    if @dissection.save
      flash[:success] = "Successfully added #{find_trail(print_if_present(@dissection.topic.name))}"
      redirect_to :back
    else
      flash[:danger] = "Please re-check information: #{@dissection.errors.full_messages}"
    end
  end

  def update
    @dissection = Dissection.find(params[:id])
    if @dissection.update(dissection_params)
      flash[:success] = "Successfully updated dissection #{find_trail(@dissection.topic_id)}"
      redirect_to session[:back_to] ||= request.referer
    else
      flash[:danger] = "Error updating dissection: #{@dissection.errors.full_messages}"
      redirect_to edit_dissection_path(@dissection.id)
    end
  end

  def destroy
    @dissection = Dissection.find(params[:id])
    @dissection.destroy
    flash[:success] = "Dissection #{@dissection.id} for #{find_trail(@dissection.topic_id)} deleted from record"
    redirect_to session[:back_to] ||= request.referer
  end

  def back_url
    request.referer
  end

  private

  def dissection_params
    params.require(:dissection).permit(
      :patient_id,
      :visit_id,
      :topic_id,
      :date,
      :time_ago_amount,
      :time_ago_scale,
      :transcript,
      :protein,
      :variant,
      :exons,
      :lab_classification,
      :clinical_classification,
      :predictive_testing_recommended,
      :lab_name,
      :attachment,
      :note
    )
  end

  def current_dissection
    @dissection = dissection.find(params[:id])
  end
end
