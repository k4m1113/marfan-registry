module CommonContent
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
    @sbp = @stats.select{|s| s.name === 'SBP' }
    @dbp = @stats.select{|s| s.name === 'DBP' }
    @stats -= (@sbp + @dbp)

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

    @all_meds = Topic.leaves.where(topic_type: "medication") << Topic.roots.where(name: "medication")[0]

    @parent = Topic.where(name: "parent")[0]
    @sibling = Topic.where(name: "sibling")[0]
    @child = Topic.where(name: "child")[0]
  end
end
