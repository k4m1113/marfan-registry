require 'report'
require 'json'
# require 'pry-remote'

# visits controller
class VisitsController < ApplicationController
  include Report
  include CommonContent
  include EditVisitContent
  include NestedParams

  respond_to :html, :js

  before_action :common_content

  def index
    @visits = Visit.all
  end

  def show
    @visit = Visit.find(params[:id])
    redirect_to edit_visit_path(@visit.id)
  end

  def new
    @visit = Visit.new
    @patient = Patient.find_by(id: params[:patient]) if params[:patient]
  end

  def edit
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient.id)
    session[:back_to] = edit_visit_path(@visit)
    edit_visit_content

  rescue ActiveRecord::RecordNotFound => e
    flash[:danger] = 'Record Not Found'
    redirect_to visits_path
  end

  def create
    @visit = Visit.new(visit_params)
    @patient = Patient.find(@visit.patient.id)
    full_name = "#{@patient.last_name}, #{@patient.first_name}"
    @form_action = 'Create'
    if @visit.save
      redirect_to edit_visit_path(@visit.id)
    else
      flash[:danger] = "Please re-check values: #{@visit.errors.full_messages}"
      Rails.logger.info(@visit.errors.inspect)
      render 'new'
      @visit = session[:current_visit]
    end
  end

  def update
    @visit = Visit.find(params[:id])
    @patient = Patient.find(@visit.patient.id)
    @form_action = 'Update'
    @patient.update(visit_params['patient_attributes']) if visit_params['patient_attributes']
    respond_to do |format|
      if @visit.update(visit_params)
        message = []
        @visit.new_concerns.each do |c|
          message << c.generate_full_summary.to_s
        end
        format.html { redirect_to edit_visit_path(@visit) }
        format.js
        format.json { render json: visit_params.to_json }
      else
        format.json { render text: @visit.errors.full_messages.to_s }
      end
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    @visit.destroy
    redirect_to :back
  end

  def back_url
    request.referer
  end

  private

  def visit_params
    nested_params
    params.require(:visit).permit(
      :id,
      :general_health,
      :height,
      :weight,
      :z_score,
      :arm_span,
      :upper_segment,
      :lower_segment,
      :patient_id,
      :clinician_id,
      :primary_reason,
      :secondary_reason,
      :vital,
      :test,
      dissections_attributes: dissections_attributes,
      genetic_tests_attributes: genetic_tests_attributes,
      hospitalizations_attributes: hospitalizations_attributes,
      medications_attributes: medications_attributes,
      patient_attributes: patient_attributes,
      tests_attributes: tests_attributes,
      vitals_attributes: vitals_attributes,
      diagnoses_attributes: diagnoses_attributes,
      heart_measurements_attributes: heart_measurements_attributes,
      family_members_attributes: family_members_attributes,
      procedures_attributes: procedures_attributes
    )
  end
end
