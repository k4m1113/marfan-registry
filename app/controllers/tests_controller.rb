# tests controller
class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def edit
    @test = Test.find(params[:id])
    @patient = Patient.find(@test.patient_id)
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      message = "#{@test.note} of #{find_pretty_trail(@test.topic_id)} added"
      flash[:success] = message
      redirect_to edit_visit_path(@test.visit_id)
    else
      message = "Please re-check information: #{@test.errors.full_messages}"
      flash[:error] = message
    end
  end

  def update
    @test = Test.find(params[:id])
    respond_to do |format|
      if @test.update(test_params)
        flash[:success] = "Updated test for #{find_trail(@test.topic_id)}"
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    message = "Test for #{find_trail(@test.topic_id)} deleted from record"
    flash[:success] = message
    redirect_to edit_visit_path(@test.visit_id)
  end

  def back_url
    request.referer
  end

  private

  def test_params
    params.fetch(:test, {})
  end
end
