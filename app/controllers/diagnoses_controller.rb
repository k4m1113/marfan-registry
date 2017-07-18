class DiagnosesController < ApplicationController
  def show
    @diagnosis = Diagnosis.find(params[:id])
  end

  def edit
    @diagnosis = Diagnosis.find(params[:id])
  end

  def update
    @diagnosis = Diagnosis.find(params[:id])
    if @diagnosis.update(diagnosis_params)
      flash[:success] = "#{@diagnosis.generate_summary} updated for patient #{@diagnosis.patient.full_name}"
      redirect_to edit_visit_path(@diagnosis.visit_id)
    else
      flash[:danger]
      render json: @diagnosis.errors, status: :unprocessable_entity
      redirect_to edit_visit_path(@diagnosis.visit_id)
    end
  end

  def destroy
    @diagnosis = Diagnosis.find(params[:id])
    @diagnosis.destroy
    flash[:success] = "Diagnosis #{@diagnosis.id} for #{find_trail(@diagnosis.topic_id)} deleted from record"
    redirect_to edit_visit_path(@diagnosis.visit_id)
  end

  def back_url
    request.referer
  end

  private

  def diagnosis_params
    params.require(:diagnosis).permit(
      :topic_id,
      :patient_id,
      :time_ago_amount,
      :time_ago_scale,
      :duration_amount,
      :duration_scale,
      :frequency_amount,
      :frequency_scale,
      :frequency,
      :time_ago,
      :absolute_start_date,
      :visit_id,
      :present,
      :note,
      :attachment
    )
  end
end
