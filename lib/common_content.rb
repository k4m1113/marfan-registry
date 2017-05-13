module CommonContent
  attr_reader :root_topics, :family_history, :genetics, :medication, :cardiovascular, :pulmonary, :ortho, :ophthalmo, :sbp, :dbp, :stats, :root, :asc, :desc, :transv, :supra, :infra, :annulus, :lvidd, :lvids, :mvp, :mmv, :mitral_regurge, :tricuspid_regurge, :mean_gradient, :valve_area, :ais, :heart_imaging_locations, :all_meds, :parent, :sibling, :child, :family_member_ids

  def common_content
    @root_topics = Topic.roots
    @family_history = Topic.where(name: 'family history')[0].self_and_descendants
    @genetics = Topic.where(name: 'genetics')[0].self_and_descendants
    @medication = Topic.where(name: 'medication')[0].self_and_descendants
    @cardiovascular = Topic.where(name: 'cardiovascular')[0].self_and_descendants
    @pulmonary = Topic.where(name: 'pulmonary')[0].self_and_descendants
    @ortho = Topic.where(name: 'orthopedic')[0].self_and_descendants
    @ophthalmo = Topic.where(name: 'ophthalmologic')[0].self_and_descendants

    @stats = Topic.where(topic_type: 'stat')
    @sbp = @stats.select{|s| s.name === 'SBP' }
    @dbp = @stats.select{|s| s.name === 'DBP' }
    @stats -= (@sbp + @dbp)

    @all_meds = (Topic.leaves.where(topic_type: 'medication') + Topic.roots.where(name: 'medication'))

    @parent = Topic.where(name: 'parent')[0]
    @sibling = Topic.where(name: 'sibling')[0]
    @child = Topic.where(name: 'child')[0]
    @family_member_ids = Topic.where(topic_type: 'family member').map(&:id)
  end
end
