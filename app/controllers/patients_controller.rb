class PatientsController < ApplicationController
  def new
    @patient = Patient.new
  end

end
