class ComplicationsController < ApplicationController
  before_action :set_complication, only: [:show, :edit, :update, :destroy]

  def index
    @complications = Complication.all
  end

  def show
    @complication = Complication.find(params[:id])
  end

  def new
    @complication = Complication.new
  end

  def edit
    @complication = Complication.find(params[:id])
  end

  def create
    @complication = Complication.new(complication_params)
    if @complication.save
      flash[:success] = "#{@complication.note} of #{find_trail(@complication.topic_id)} added to visit"
      redirect_to :back
    else
      flash[:error] = "Please re-check information: #{@complication.errors.full_messages}"
      Rails.logger.info(@complication.errors.inspect)
      render :back
    end
  end

  def update
    @complication = Complication.find(params[:id])
    if @complication.update(complication_params)
      flash[:success] = "#{@complication.note} of #{find_trail(@complication.topic_id)} added to visit"
      redirect_to edit_visit_path(@complication.visit_id)
    else
      flash[:error]
      render json: @complication.errors, status: :unprocessable_entity
      redirect_to edit_visit_path(@complication.visit_id)
    end
  end

  def destroy
    @complication = Complication.find(params[:id])
    @complication.destroy
    flash[:success] = "Complication #{@complication.id} for #{find_trail(@complication.topic_id)} deleted from record"
    redirect_to :back
  end

  private

  def complication_params
    params.permit(
      :topic_id,
      :patient_id,
      :time_ago,
      :time_ago_scale,
      :absolute_start_date,
      :visit_id,
      :note
    )
  end
end
