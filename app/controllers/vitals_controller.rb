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
    if @vital.save
      flash[:success] = "#{@vital.note} of #{find_pretty_trail(Topic.find(@vital.topic_id))} added to visit"
      redirect_to edit_visit_path(@vital.visit_id)
    else
      flash[:danger] = "Please re-check information: #{@vital.errors.full_messages}"
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
    params.fetch(:vital, {})
  end
end
