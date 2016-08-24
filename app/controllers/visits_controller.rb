class VisitsController < ApplicationController
  def new
    @visit = Visit.new
  end

  def create
    @visit = Visit.new(visit_params)
    @form_action = "Create"
    if @visit.save
      redirect_to :action => :index
    else
      render :new
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end

  def index
    @visits = Visit.all
  end

  def edit
    @visit = Visit.find(params[:id])
  end

  def update
    @visit = Visit.find(params[:id])
    @form_action = "Update"
    if @visit.update(visit_params)
      flash[:notice] = "Successfully updated visit"
      redirect_to visit_path(@visit)
    else
      flash[:alert] = "You are not allowed to edit this visit"
      render :edit
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:height, :weight, :z_score,
    :arm_span, :upper_segment, :lower_segment, :patient_id)
  end
end
