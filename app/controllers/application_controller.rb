require 'application_helper'

class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
end
