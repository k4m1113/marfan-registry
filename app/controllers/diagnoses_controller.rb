class DiagnosesController < ApplicationController
  def new
    @diagnosis = Diagnosis.new
  end

  def create
    @diagnosis = Diagnosis.new(diagnosis_params)
    if @diagnosis.save
      flash[:success] = "#{@diagnosis.note} of #{find_trail(Topic.find(@diagnosis.topic_id))} added to visit"
      redirect_to edit_visit_path(@diagnosis.visit_id)
    else
      flash[:error]
      render json: @hospitalization.errors, status: :unprocessable_entity
    end
  end

  private

  def diagnosis_params
    params.permit(
      :topic_id,
      :patient_id,
      :time_ago,
      :time_ago_scale,
      :absolute_start_date,
      :visit_id,
      :note
    )
  end
end
