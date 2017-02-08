module ApplicationHelper

  def find_step(min, max)
    if min.to_s.include?(".")
      num_1 = min.to_s.split(".").last.size
    else
      num_1 = 0
    end
    if max.to_s.include?(".")
      num_2 = max.to_s.split(".").last.size
    else
      num_2 = 0
    end
    dec = [num_1, num_2].max
    ((dec === 0) ? 1 : 10**-dec).to_f
  end

  def print_if_present(attribute)
    case attribute
    when attribute.class === 'String'
      attribute.empty? ? 'not noted' : attribute
    when attribute.class === 'Fixnum'
      attribute.nil? ? 'not noted' : attribute
    else
      attribute.nil? ? 'not noted' : attribute
    end
  end

  def find_trail(topic_id)
    topic = Topic.find(topic_id)
    topic.self_and_ancestors.map(&:name).join(" > ")
  end

  def display_test_date(t)
    if t.test_date
      return t.test_date.strftime('%d %B %Y')
    elsif t.time_ago
      return "#{t.time_ago} #{t.time_ago_scale} ago".downcase
    else
      return "not noted"
    end
  end

  def display_date(topic_type)
    if topic_type.absolute_start_date
      return topic_type.absolute_start_date.strftime('%d %B %Y')
    elsif topic_type.time_ago
      return "#{topic_type.time_ago} #{topic_type.time_ago_scale} ago"
    else
      return "not noted"
    end
  end

  def button_color(topic_group, cat)
    if topic_group.any?{ |t| t.topic_id == cat.id }
      return 'btn-info'
    else
      return 'btn-secondary'
    end
  end

  def render_form_button(category, scope)
    case category.topic_type
    when 'family member'
      render html: "<button type='button' class='btn #{button_color(scope.family_members, category)} pull-right down-eight' value='#{category.id}' id='family-reason' onclick='renderFamilyMemberTopicForm($(this).val());'>Add relationship details</button>".html_safe
    when 'measurement'
      render html: "<button type='button' class='btn #{button_color(scope.tests, category)} pull-right down-eight' value='<%= #{category.id} %>' id='test-reason' onclick='renderTestTopicForm($(this).val());'>Add test details</button>".html_safe
    when 'procedure'
      render html: "<button type='button' class='btn #{button_color(scope.procedures, category)} pull-right down-eight' value='#{category.id}' id='procedure-reason' onclick='renderProcedureTopicForm($(this).val());'>Add procedure details</button>".html_safe
    when 'complication'
      render html: "<button type='button' class='btn #{button_color(scope.complications, category)} pull-right down-eight' value='#{category.id}' id='complication-reason' onclick='renderComplicationTopicForm($(this).val());'>Add details</button>".html_safe
    when 'symptom'
      render html: "<button type='button' class='btn #{button_color(scope.symptoms, category)} pull-right down-eight' value='#{category.id}' id='symptom-reason'>Add symptom details</button>".html_safe
    when 'diagnosis'
      if @visit
        render html: "<form class='button_to' method='post' action='/diagnoses?note=presence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}&amp;visit_id=#{@visit.id}'><button class='btn btn-success pull-right down-eight' type='submit'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></button></form><form class='button_to' method='post' action='/diagnoses?note=absence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}&amp;visit_id=#{@visit.id}'><button class='btn btn-danger pull-right down-eight' type='submit'><span class='glyphicon glyphicon-minus' aria-hidden='true'></span></button></form>".html_safe
      else
        render html: "<form class='button_to' method='post' action='/diagnoses?note=presence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}'><button class='btn btn-success pull-right down-eight' type='submit'><span class='glyphicon glyphicon-plus' aria-hidden='true'></span></button></form><form class='button_to' method='post' action='/diagnoses?note=absence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}'><button class='btn btn-danger pull-right down-eight' type='submit'><span class='glyphicon glyphicon-minus' aria-hidden='true'></span></button></form>".html_safe
      end

    when 'medication'
      render html: "<button type='button' class='btn btn-info pull-right down-eight' value='#{category.id}' id='med-reason' onclick='renderMedTopicForm($(this).val());'>Add medication details</button>".html_safe
    when 'stat'
      render html: "<button type='button' class='btn btn-info pull-right down-eight' value='#{category.id}' id='stat-reason' onclick='renderStatTopicForm($(this).val());'>Add vitals details</button>".html_safe
    end
  end
end
