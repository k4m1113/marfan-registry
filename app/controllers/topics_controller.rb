class TopicsController < ApplicationController
  def index
    @root_topics = Topic.roots
    @genetics = Topic.where(name: "genetics")[0].self_and_descendants
    @medications = Topic.where(name: "medication")[0].self_and_descendants
    @cardio = Topic.where(name: "cardiovascular")[0].self_and_descendants
    @pulmonary = Topic.where(name: "pulmonary")[0].self_and_descendants
    @ortho = Topic.where(name: "orthopedic")[0].self_and_descendants
    @ophthalmo = Topic.where(name: "ophthalmologic")[0].self_and_descendants
    @visit = Visit.new(patient_id: 1)
  end

  def show

  end

  def new
    @topic = Topic.new
  end

  def create
  end

  def edit

  end

  def update
  end

  def destroy
  end
end
