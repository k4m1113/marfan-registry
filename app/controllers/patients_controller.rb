class PatientsController < ApplicationController
  include CommonContent

  def index
    if params[:search].present?
      @patients = Patient.perform_search(params[:search]).paginate(:page => params[:page])
    else
      @patients = Patient.all.paginate(:page => params[:page])
    end

  end

  def show
    @patient = Patient.find(params[:id])

    @concerns = @patient.sort_by_topic
    @sorted_concerns = @patient.sort_by_topic_then_type
    @vitals = @patient.vitals_by_date
    @imagery = @patient.heart_measurements_by_date
  rescue ActiveRecord::RecordNotFound => e
    flash[:error] = "Record Not Found"
    redirect_to patients_path
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

  def edit
    @patient = Patient.find(params[:id])
    @nested_scope = @patient

    @family_members = FamilyMember.where(patient_id: @patient.id)
    @children = @patient.family_members.select{ |relation| relation['topic_id'] === @child.id}
    @siblings = @patient.family_members.select{ |relation| relation['topic_id'] === @sibling.id}
    @parents = @patient.family_members.select{ |relation| relation['topic_id'] === @parent.id}

    @tests = tests = Test.where(patient_id: @patient.id)
    @imagery = imagery = @tests.find_all{|t| Topic.where(topic_type: "heart_measurement").collect(&:id).include?(t.topic_id) }
    @tests = tests -= @imagery
  end

  def create
    @patient = Patient.new(patient_params)
    if @patient.save
      flash[:success] = "Patient #{@patient.last_name}, #{@patient.first_name} successfully added!"
      redirect_to new_visit_path(patient: @patient)
    else
      render 'new'
    end
  end

  def update
    @patient = Patient.find(params[:id])
    if @patient.update(patient_params)
      flash[:success] = "Patient #{@patient.first_name} #{@patient.last_name} updated successfully!"
      redirect_to patient_path(@patient.id)
    else
      flash[:error] = "Please correct the following errors: #{@patient.errors.full_messages}"
      redirect_to edit_patient_path(@patient.id)
    end
  end

  def destroy
    @patient = Patient.find(params[:id])
    if @patient.visits
      Visit.where(patient_id: @patient.id).each(&:destroy)
    end
    @patient.destroy
    flash[:success] = "Patient #{@patient.full_name} and all associated records destroyed"
    redirect_to patients_path
  end

  def back_url
    request.referer
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :middle_name,
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
      :note,
      :phone_1,
      :phone_2,
      :email,
      vitals_attributes:
        %i[visit_id patient_id topic_id vital measurement note],
      medications_attributes:
        %i[visit_id patient_id topic_id dose dose_unit_of_measurement nested_med_id nested_med_category duration_amount duration_scale ingestion_method frequency frequency_scale common_name medication_format time_ago time_ago_scale absolute_start_date note],
      diagnoses_attributes:
        %i[topic_id patient_id time_ago_amount time_ago_scale duration duration_scale absolute_start_date visit_id note present],
      procedures_attributes:
        %i[topic_id patient_id clinician_id visit_id note],
      family_members_attributes:
        [:visit_id, :patient_id, :topic_id, :future_patient_data_hash, {future_patient_data_hash: [
        :first_name, :last_name, :born_years_ago, :date_of_birth, :deceased, :cause_of_death, :note]}],
      hospitalizations_attributes:
        %i[visit_id patient_id topic_id hospitalization admission_date time_ago time_ago_scale length_of_stay length_of_stay_scale hosp_type description location note],
      tests_attributes:
        %i[visit_id topic_idpatient_id test absolute_start_date time_ago time_ago_scale result note]
      )
  end
end
