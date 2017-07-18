class GeneticTestsController < ApplicationController
  respond_to :html, :js

  def index
    @genetic_tests = GeneticTest.all
  end

  def show
    @genetic_test = GeneticTest.find(params[:id])
  end

  def new
    @genetic_test = GeneticTest.new
  end

  def edit
    @genetic_test = GeneticTest.find(params[:id])
  end

  def create
    @genetic_test = GeneticTest.new(genetic_test_params)
    if @genetic_test.save
      flash[:success] = "Successfully added #{find_trail(print_if_present(@genetic_test.topic.name))}"
      redirect_to :back
    else
      flash[:danger] = "Please re-check information: #{@genetic_test.errors.full_messages}"
    end
  end

  def update
    @genetic_test = GeneticTest.find(params[:id])
    if @genetic_test.update(genetic_test_params)
      flash[:success] = "Successfully updated genetic_test #{find_trail(@genetic_test.topic_id)}"
      redirect_to :back
    else
      flash[:danger] = "Error updating genetic_test: #{@genetic_test.errors.full_messages}"
      redirect_to edit_genetic_test_path(@genetic_test.id)
    end
  end

  def destroy
    @genetic_test = GeneticTest.find(params[:id])
    @genetic_test.destroy
    flash[:success] = "GeneticTest #{@genetic_test.id} for #{find_trail(@genetic_test.topic_id)} deleted from record"
    redirect_to :back
  end

  def back_url
    request.referer
  end

  private

  def genetic_test_params
    params.require(:genetic_test).permit(
      :patient_id,
      :visit_id,
      :topic_id,
      :date,
      :time_ago_amount,
      :time_ago_scale,
      :transcript,
      :protein,
      :variant,
      :exons,
      :lab_classification,
      :clinical_classification,
      :predictive_testing_recommended,
      :lab_name,
      :attachment,
      :note
    )
  end

  def current_genetic_test
    @genetic_test = genetic_test.find(params[:id])
  end
end
