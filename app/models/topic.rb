class Topic < ApplicationRecord
  acts_as_nested_set
  attr_reader :keyify

  def keyify
    rt = name.parameterize.underscore
    if rt == 'morphology_physical_finding' || rt == 'vital'
      rt = rt.pluralize
    end
    rt
  end
end
