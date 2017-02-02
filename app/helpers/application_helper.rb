module ApplicationHelper
  def print_if_present(attribute)
    case attribute
    when attribute.class === "String"
      attribute.empty? ? "not noted" : attribute
    when attribute.class === "Fixnum"
      attribute.nil? ? "not noted" : attribute
    else
      attribute.nil? ? "not noted" : attribute
    end
  end

  def button_color(topic_group, category)
    if topic_group.any?{ |t| t.topic_id == category.id }
      return "btn-success"
    else
      return "btn-danger"
    end
  end

  def find_trail(topic)
    topic.self_and_ancestors.map(&:name).join(" > ")
  end

  def display_date(topic_type)
    if topic_type.absolute_start_date
      return topic_type.absolute_start_date.strftime("%d %B %Y")
    elsif topic_type.time_ago
      return "#{topic_type.time_ago} #{topic_type.time_ago_scale} ago"
    else
      return "not noted"
    end
  end
end
