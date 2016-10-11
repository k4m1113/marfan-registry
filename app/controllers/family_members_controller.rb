class FamilyMembersController < ApplicationController
  def index
    @family_members = FamilyMember.all
  end

  def new
    @family_member = FamilyMember.find(params[:id])
  end

  def create
    @family_member = FamilyMember.new(family_member_params)

    if @family_member.save
      render json: @family_member
    else
      render json: @family_member.errors, status: :unprocessable_entity
    end
  end

  def update
    if @family_member.update(family_member_params)
      render json: @family_member
    else
      render json: @family_member.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @family_member.destroy
    head :no_content
  end

  private

  def family_member_params
    params.require(:family_member).permit(
    :patient_id,
    :relationship,
    :name,
    :age,
    :living,
    :cause_of_death,
    :note)
  end

  def current_family_member
    @family_member = family_member.find(params[:id])
  end

end
