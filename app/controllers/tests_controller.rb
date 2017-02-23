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
      flash[:success] = "#{@test.note} of #{find_pretty_trail(Topic.find(@test.topic_id))} added to visit"
      redirect_to edit_visit_path(@test.visit_id)
    else
      flash[:error] = "Please re-check information: #{@test.errors.full_messages}"
    end
  end

  def update
    @test = Test.find(params[:id])
    respond_to do |format|
      if @test.update(test_params)
        flash[:success] = "Test #{@test.id} for #{find_trail(@test.topic_id)} updated record"
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    flash[:success] = "Test #{@test.id} for #{find_trail(@test.topic_id)} deleted from record"
    redirect_to :back
  end

  private
  
  def test_params
    params.fetch(:test, {})
  end
end
