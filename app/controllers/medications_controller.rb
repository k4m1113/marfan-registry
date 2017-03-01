class MedicationsController < ApplicationController
  def index
    @diagnoses = Medication.all
  end

  def show
    @medication = Medication.find(params[:id])
  end

  def new
    @medication = Medication.new
  end

  def edit
    @medication = Medication.find(params[:id])
  end

  def create
    @medication = Medication.new(medication_params)
    if @medication.save
      flash[:success] = "#{@medication.note} of #{find_trail(@medication.topic_id)} added to visit"
      redirect_to :back
    else
      flash[:error] = "Please re-check information: #{@medication.errors.full_messages}"
      Rails.logger.info(@medication.errors.inspect)
      render :back
    end
  end

  def update
    if @medication.update(medication_params)
      flash[:success] = "#{@medication.note} of #{find_trail(@medication.topic_id)} added to visit"
      redirect_to edit_visit_path(@medication.visit_id)
    else
      flash[:error]
      render json: @medication.errors, status: :unprocessable_entity
      redirect_to edit_visit_path(@medication.visit_id)
    end
  end

  def destroy
    @medication.destroy
    flash[:success] = "Medication #{@medication.id} for #{find_trail(@medication.topic_id)} deleted from record"
    redirect_to :back
  end

  private

  def set_medication
    @medication = Medication.find(params[:id])
  end

  def medication_params
    params.require(:medication).permit(
      :patient_id,
      :visit_id,
      :dose,
      :dose_unit_of_measurement,
      :nested_med_id,
      :nested_med_category,
      :duration_amount,
      :duration_scale,
      :ingestion_method,
      :frequency,
      :frequency_scale,
      :common_name,
      :medication_format,
      :topic_id,
      :time_ago,
      :time_ago_scale,
      :absolute_start_date,
      :note,
      :name,
      :dosage_form,
      :dosage_form_units
    )
  end
end
