class VisitsController < ApplicationController
  def new
    @visit = Visit.new
  end

end
