require 'application_helper'

class ApplicationController < ActionController::Base
  include ApplicationHelper
  helper :all
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery

  def common_content
    @root_topics = Topic.roots
    @family_history = Topic.where(name: "family history")[0].self_and_descendants
    @genetics = Topic.where(name: "genetics")[0].self_and_descendants
    @medication = Topic.where(name: "medication")[0].self_and_descendants
    @cardiovascular = Topic.where(name: "cardiovascular")[0].self_and_descendants
    @pulmonary = Topic.where(name: "pulmonary")[0].self_and_descendants
    @ortho = Topic.where(name: "orthopedic")[0].self_and_descendants
    @ophthalmo = Topic.where(name: "ophthalmologic")[0].self_and_descendants

    @stats = Topic.where(topic_type: "stat")

    @root = Topic.where(parent_id: Topic.where(name: "aortic root")[0].id)
    @asc = Topic.where(parent_id: Topic.where(name: "ascending aortic")[0].id)
    @transv = Topic.where(parent_id: Topic.where(name: "transverse arch")[0].id)
    @desc = Topic.where(parent_id: Topic.where(name: "descending thoracic aorta")[0].id)
    @supra = Topic.where(parent_id: Topic.where(name: "suprarenal abdominal aorta")[0].id)
    @infra = Topic.where(parent_id: Topic.where(name: "infrarenal abdominal aorta")[0].id)
    @annulus = Topic.where(parent_id: Topic.where(name: "aortic annulus")[0].id)
    @lvidd = Topic.where(name: "LVIDd")[0]
    @lvids = Topic.where(name: "LVIDs")[0]
    @mvp = Topic.where(name: "mitral valve prolapse")[0]
    @mmv = Topic.where(name: "myxomatous mitral valve")[0]
    @mitral_regurge = Topic.where(name: "mitral regurgitation severity")[0]
    @tricuspid_regurge = Topic.where(name: "tricuspid regurgitation severity")[0]
    @mean_gradient = Topic.where(name: "mean gradient")[0]
    @valve_area = Topic.where(name: "valve area")[0]
    @ais = Topic.where(name: "aortic insufficiency severity")[0]
    @heart_imaging_locations = [@root.map(&:id), @asc.map(&:id), @transv.map(&:id), @desc.map(&:id), @supra.map(&:id), @infra.map(&:id), @annulus.map(&:id), @lvidd, @lvids, @mvp, @mmv, @mitral_regurge, @tricuspid_regurge, @mean_gradient, @valve_area, @ais]

    @parent = Topic.where(name: "parent")[0]
    @sibling = Topic.where(name: "sibling")[0]
    @child = Topic.where(name: "child")[0]
  end
end
