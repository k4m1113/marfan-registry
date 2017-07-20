require 'json'
# require 'pry'

class FamilyMembersController < ApplicationController
  respond_to :html, :js
  helper_method :make_patient

  def index
    if params[:search].present?
      @family_members = FamilyMember.perform_search(params[:search])
    else
      @family_members = FamilyMember.all
    end
    @family_members.paginate(page: params[:page])
  end

  def show
    @family_member = FamilyMember.find(params[:id])
    @relationship = Topic.find(@family_member.topic_id)
    @patient = Patient.find(@family_member.patient_id)
  end

  def new
    @family_member = FamilyMember.new
    @visit = session[:current_visit]
    @patient = Patient.find_by(id: params[:patient]) if params[:patient]
  end

  def edit
    @family_member = FamilyMember.find(params[:id])
    @patient = Patient.find(@family_member.patient_id)
  end

  def create
    @family_member = FamilyMember.new(family_member_params)
    fpdh = @family_member.future_patient_data_hash

    if @family_member.save
      flash[:success] = "#{fpdh['first_name']} added"
      redirect_to edit_visit_path(@family_member.visit_id)
    else
      flash[:notice] = "Please correct the following errors: #{@family_member.errors.full_messages}"
    end
  end

  def update
    @family_member = FamilyMember.find(params[:id])
    if @family_member.update(family_member_params)
      flash[:success] = "Family Member #{@family_member.id} updated"
    else
      flash[:danger] = "Please correct the following errors: #{@family_member.errors.full_messages}"
    end
    redirect_to edit_visit_path(@family_member.visit_id)
  end

  def destroy
    FamilyMember.find(params[:id]).destroy
    flash[:success] = 'Relationship record destroyed.'
    redirect_to :back
  end

  private

  def family_member_params
    params.require(:family_member).permit(
    :visit_id,
    :patient_id,
    :topic_id,
    :family_member,
    :future_patient_data_hash,
    :attachment,
    future_patient_data_hash:
      %i[first_name last_name born_years_ago date_of_birth deceased death_time_ago death_time_ago_scale death_date cause_of_death note]
    )
  end
end
