class RelationshipsController < ApplicationController
  respond_to :html, :js

  def index
    @relationships = Relationship.all
  end

  def new
    @relationship = Relationship.new
    @relationship_patient = Patient.new
  end

  def create
    @relationship = Relationship.new(relationship_params)
    @relationship_patient = Patient.where(id: @relationship.relationship_patient_id)[0]
    @relationship_patient.sex = SeededRelationshipType.where(id: @relationship.seeded_relationship_type_id)[0].gender

    if @relationship.save
      flash[:notice] = "#{@relationship.name} added successfully!"
      redirect_to edit_visit_path(session[:current_visit])
    else
      flash[:error] = "Please correct the following errors: #{@family_member.errors}"
      render json: @family_member.errors, status: :unprocessable_entity
    end
  end

  def edit
    @relationship
    @relationship_patient = Patient.where(id: @relationship.relationship_patient_id)[0]
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

  def relationship_params
    params.require(:patient).permit(
    :visit_id,
    :relationship_patient_id,
    :seeded_relationship_type_id,
    relationship_patients_attributes:
      [:first_name, :last_name, :sex, :deceased, :cause_of_death, :note]
    )
  end

end
