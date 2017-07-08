# initialize Topic with awesome_nested_set; custom methods
class Topic < ApplicationRecord
  acts_as_nested_set
  attr_reader :aunts
  def aunts
    if parent && parent.topic_type != 'root category'
      parent.siblings
    else
      []
    end
  end
end
