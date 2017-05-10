class TopicsController < ApplicationController
  def index
    @root_topics = Topic.roots
    @genetics = Topic.where(name: 'genetics')[0].self_and_descendants
    @medication = Topic.where(name: 'medication')[0].self_and_descendants
    @cardiovascular = Topic.where(name: 'cardiovascular')[0].self_and_descendants
    @pulmonary = Topic.where(name: 'pulmonary')[0].self_and_descendants
    @ortho = Topic.where(name: 'orthopedic')[0].self_and_descendants
    @ophthalmo = Topic.where(name: 'ophthalmologic')[0].self_and_descendants
    @visit = Visit.new(patient_id: 1)
  end

  def show
    @topic = Topic.find(params[:id])
    case @topic.topic_type
    when 'family member'
      @all = FamilyMember.where(topic_id: @topic.id)
    when 'measurement'
      @all = Test.where(topic_id: @topic.id)
    when 'procedure'
      @all = Procedure.where(topic_id: @topic.id)
    when 'diagnosis'
      @all = Diagnosis.where(topic_id: @topic.id)
    when 'medication'
      @all = Medication.where(topic_id: @topic.id)
    when 'stat'
      @all = Vital.where(topic_id: @topic.id)
    when 'heart_measurement'
      @all = Test.where(topic_id: @topic.id)
    end
  end

  def edit
  end

  def new
    @topic = Topic.new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
