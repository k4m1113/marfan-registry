class PatientsController < ApplicationController
  def index
    if params[:search].present?
      @patients = Patient.perform_search(params[:search]).paginate(:page => params[:page])
    else
      @patients = Patient.all.paginate(:page => params[:page])
    end
  end

  def new
    @patient = Patient.new
    if params[:fm]
      @fm = FamilyMember.find(params[:fm])
      if @fm.future_patient_data_hash
        @fpdh = @fm.future_patient_data_hash
      else
        @fpdh = {"note"=>"", "deceased"=>"", "last_name"=>"", "first_name"=>"", "date_of_birth"=>"", "cause_of_death"=>""}
      end
      @patient.first_name = @fpdh['first_name']
      @patient.last_name = @fpdh['last_name']
      @patient.date_of_birth = @fpdh['date_of_birth'].to_date
      @patient.note = @fpdh['note']
      @patient.cause_of_death = @fpdh['cause_of_death']
      @patient.deceased = @fpdh['deceased']
      @patient.sex = SeededRelationshipType.find(@fm.seeded_relationship_type_id).gender
    end
    if params[:start_visit]

    end
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:notice] = "Patient #{@patient.last_name}, #{@patient.first_name} successfully added!"
      redirect_to patients_path
    else
      flash[:error] = "Please re-check information and/or fill required fields: #{@patient.errors}"
      render 'new'
    end
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = "Patient #{@patient.first_name} #{@patient.last_name} updated successfully!"
      redirect_to patient_path(@patient.id)
    else
      flash[:error] = "Please correct the following errors: #{@patient.errors}"
      redirect_to edit_patient_path(@patient.id)
    end
  end

  def show
    @patient = Patient.find(params[:id])
    case @patient.sex
    when 'F'
      @gender = 'Female'
    when
      @gender = 'Male'
    else
      @gender = 'Not noted'
    end
    @visits = Visit.where(patient_id: @patient.id)
  end

  def destroy
    Patient.find(params[:id]).destroy
    redirect_to patients_path
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
      :sex,
      :deceased,
      :cause_of_death,
      :note
      )
  end
end
