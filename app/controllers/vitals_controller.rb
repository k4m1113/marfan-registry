class VitalsController < ApplicationController
  def index
    @vitals = Vital.all
  end

  def show
    @vital = Vital.find(params[:id])
  end

  def new
    @vital = Vital.new
  end

  def edit
    @vital = Vital.find(params[:id])
    @patient = Patient.find(@vital.patient_id)
  end

  def create
    @vital = Vital.new(vital_params)
    respond_to do |format|
      if @vital.update(vital_params)
        format.html
        format.js
        format.json { render json: vital_params }
      else
        format.json { render text: @vital.errors.full_messages.to_s }
      end
    end
  end

  def update
    @vital = Vital.find(params[:id])
    respond_to do |format|
      if @vital.update(vital_params)
        flash[:success] = "Vital #{@vital.id} for #{find_trail(@vital.topic_id)} updated record"
        redirect_to session[:back_to] ||= request.referer
      else
        format.html { render :edit }
        format.json { render json: @vital.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vital = Vital.find(params[:id])
    @vital.destroy
    flash[:success] = "Vital #{@vital.id} for #{find_trail(@vital.topic_id)} deleted from record"
    redirect_to session[:back_to] ||= request.referer
  end

  private

  def vital_params
    params.permit(
      %i[visit_id patient_id topic_id vital measurement note]
    )
  end
end
