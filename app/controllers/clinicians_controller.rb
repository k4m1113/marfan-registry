class CliniciansController < ApplicationController
  def index
    @clinicians = Clinician.all
  end

  def new
    @clinician = Clinician.new
  end

  def create
    @clinician = Clinician.new(clinician_params)
    if @clinician.save
      redirect_to :action => :index
    else
      render 'new'
    end
  end

  def show
    @clinician = Clinician.find(params[:id])
    @visits = Visit.where(clinician_id: @clinician.id)
  end

  private

  def clinician_params
    params.require(:clinician).permit(
      :first_name,
      :last_name,
      :practice_name,
      :address_line_1,
      :address_line_2,
      :address_line_3,
      :city,
      :state,
      :postal_code,
      :country)
  end
end
