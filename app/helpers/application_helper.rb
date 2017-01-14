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

  def find_trail(topic)
    topic.self_and_ancestors.map(&:name).join(" > ")
  end
end
