class PatientsController < ApplicationController
  def index
    if params[:search].present?
      @patients = Patient.perform_search(params[:search])
    else
      @patients = Patient.all
    end
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.save
      redirect_to :action => :index
    else
      render 'edit'
    end
  end

  def show
    @patient = Patient.find(params[:id])
    @visits = Visit.where(patient_id: @patient.id)
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :address_line_1,
      :address_line_2,
      :address_line_3,
      :city,
      :state,
      :postal_code,
      :country,
      :date_of_birth,
      :sex)
  end
end
