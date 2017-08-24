class ProceduresController < ApplicationController
  def index
    @procedures = Procedure.all
  end

  def show
    @procedure = Procedure.find(params[:id])
  end

  def new
    @procedure = Procedure.new
  end

  def edit
    @procedure = Procedure.find(params[:id])
    @patient = @procedure.patient
  end

  def create
    @procedure = Procedure.new(procedure_params)
    if @procedure.save
      flash[:success] = "#{find_trail(print_if_present(@procedure.topic.name))}"
      redirect_to :back
    else
      flash[:danger] = "Please re-check information: #{@procedure.errors.full_messages}"
    end
  end

  def update
    def update
      @procedure = Procedure.find(params[:id])
      @form_action = "Update"
      if @procedure.update(procedure_params)
        flash[:success] = "Successfully updated procedure #{find_trail(@procedure.topic_id)}"
        redirect_to session[:back_to] ||= request.referer
      else
        flash[:danger] = "Error updating procedure: #{@procedure.errors.full_messages}"
        redirect_to edit_procedure_path(@procedure.id)
      end
    end
  end

  def destroy
    @procedure = Procedure.find(params[:id])
    @procedure.destroy
    flash[:success] = "Procedure #{@procedure.id} for #{find_trail(@procedure.topic_id)} deleted from record"
    redirect_to session[:back_to] ||= request.referer
  end

  def back_url
    request.referer
  end

  private

  def procedure_params
    params.require(:procedure).permit(
      :patient_id,
      :visit_id,
      :topic_id,
      :clinician_id,
      :time_ago,
      :time_ago_scale,
      :absolute_start_date,
      :note,
      :attachment
    )
  end
end
