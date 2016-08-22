class PatientsController < ApplicationController
  def index
    @patients = Patient.all
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

  def show
    @patient = Patient.find(params[:id])
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :month_of_birth,
    :day_of_birth, :year_of_birth, :sex)
  end
end
