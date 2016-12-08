class FamilyMembersController < ApplicationController
  respond_to :html, :js

  def index
    @family_members = FamilyMember.all
  end

  def new
    @visit = session[:current_visit]
  end

  def create
    @family_member = FamilyMember.new(family_member_params)
    @visit = session[:current_visit]

    if @family_member.save
      flash[:notice] = "#{@family_member.future_patient_data_hash["first_name"]}added successfully!"
      redirect_to edit_visit_path(@family_member.visit_id)
    else
      flash[:error] = "Please correct the following errors: #{@family_member.errors}"
      render json: @family_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @family_member.update(family_member_params)

      render json: @family_member
    else
      flash[:error] = "Please correct the following errors: #{@family_member.errors}"
      redirect_to edit_visit_path(@family_member.visit_id)
    end
  end

  def destroy
    FamilyMember.find(params[:id]).destroy
    redirect_to visit_path(session[:current_visit])
    head :no_content
  end

  private

  def family_member_params
    params.require(:family_member).permit(
    :visit_id,
    :seeded_relationship_type_id,
    future_patient_data_hash: [:first_name, :last_name, :date_of_birth, :cause_of_death, :deceased, :note])
  end

  def current_family_member
    @family_member = family_member.find(params[:id])
  end

end
