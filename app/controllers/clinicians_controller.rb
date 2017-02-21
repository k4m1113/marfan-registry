class CliniciansController < ApplicationController
  def index
    @clinicians = Clinician.all
  end

  def show
    @clinician = Clinician.find(params[:id])
    @visits = Visit.where(clinician_id: @clinician.id)
  end

  def new
    @clinician = Clinician.new
  end

  def edit
    @clinician = Clinician.find(params[:id])
  end

  def create
    @clinician = Clinician.new(clinician_params)
    if @clinician.save
      flash[:success] = "Clinician #{@clinician.last_name}, #{@clinician.first_name} successfully added!"

      redirect_to :action => :index
    else
      flash[:error] = "Please re-check information and/or fill required fields."
      render 'new'
    end
  end

  def update
    @clinician = Clinician.find(params[:id])
    if @clinician.save
      redirect_to :action => :index
    else
      render 'edit'
    end
  end

  def destroy
    @clinician = Clinician.find(params[:id])
    @clinician.destroy
    flash[:success] = "Clinician #{@clinician.id} #{@clinician.last_name}, #{@clinician.first_name} deleted from record"
    redirect_to :back
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
