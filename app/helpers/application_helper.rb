module ApplicationHelper
  def find_date(int, meas, meas_date)
    case meas
    when *['Days', 'days', 'day', 'Day', 'd', 'D', 'd.', 'D.']
      return meas_date.to_datetime - (int.to_i).days
    when *['Weeks', 'weeks', 'week', 'Week', 'w', 'W', 'w.', 'W.']
      return meas_date.to_datetime - (int.to_i).weeks
    when *['Months', 'months', 'month', 'Month', 'm', 'M', 'm.', 'M.']
      return meas_date.to_datetime - (int.to_i).months
    when *['Years', 'years', 'year', 'Year', 'y', 'Y', 'y.', 'Y.']
      return meas_date.to_datetime - (int.to_i).years
    end
  end

  def list_constructor(arr, conjunction = "and", punctuation = ",")
    list = ""
    if arr.length == 1
      list << "#{arr[0]}"
    else
      arr.each_with_index do |item, index|
        if index < (arr.length - 1)
          list << "#{item}#{punctuation} "
        else
          list << "#{conjunction} #{item}"
        end
      end
    end
    return list
  end

  def create_select(min, max, step)
    if min === 0 && max === 1 && step === 1
      return [nil, false, true]
    else
      if step == 1
        return (min..max).step(step).to_a.map{|i| i.round(0)}.unshift(nil)
      else
        return (min..max).step(step).to_a.map{|i| i.round(2)}.unshift(nil)
      end
    end
  end

  def death_info(fm)
    if fm.future_patient_data_hash['deceased'].blank?
      dead = nil
    elsif fm.future_patient_data_hash['deceased'].to_i === 1
      unless fm.future_patient_data_hash['cause_of_death'].blank?
        dead = "died of #{fm.future_patient_data_hash['cause_of_death']}"
      end
      if !fm.future_patient_data_hash['death_date'].blank?
        # string interpolate '-01' to fit YYYY-MM-DD for Date with fuzzy data
        death_date = (fm.future_patient_data_hash['death_date'] + "-01").to_datetime
      elsif !fm.future_patient_data_hash['death_time_ago'].blank? && !fm.future_patient_data_hash['death_time_ago_scale'].blank?
        death_date = find_date(fm.future_patient_data_hash['death_time_ago'], fm.future_patient_data_hash['death_time_ago_scale'], fm.created_at)
      end
      age_at_death = death_date.year - (fm.future_patient_data_hash['date_of_birth'] + "-01").to_datetime.year
    elsif fm.future_patient_data_hash['deceased'].to_i === 0
      dead = 'Living'
      age_at_death = Date.today.year - (fm.future_patient_data_hash['date_of_birth'] + '-01').to_datetime.year
    end
    return dead + " (~#{age_at_death} y/o)"
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
    topic.self_and_ancestors.select { |t| t.depth > 0 } .map(&:name).join(' > ')
  end

  def find_pretty_trail(topic_id)
    topic = Topic.find(topic_id)
    if topic.depth <= 1
      topic.name
    else
      descriptors = topic.self_and_ancestors.reverse_each.map(&:name)
      descriptors.pop
      descriptors.join(" ")
    end
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
      return nil
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
      # render html: "<button type='button' class='btn #{button_color(scope.family_members, category)} pull-right down-eight' value='#{category.id}' id='family-reason' onclick='renderFamilyMemberTopicForm($(this).val());'>Add relationship details</button>".html_safe
    when 'measurement'
      render html: "<button type='button' class='btn #{button_color(scope.tests, category)} pull-right down-eight' value='#{category.id}' id='test-reason' onclick='renderTestTopicForm($(this).val());'>Add test details</button>".html_safe
    when 'procedure'
      render html: "<button type='button' class='btn #{button_color(scope.procedures, category)} pull-right down-eight' value='#{category.id}' id='procedure-reason' onclick='renderProcedureTopicForm($(this).val());'>Add procedure details</button>".html_safe
    when 'diagnosis'
      if @visit
        render html: "<form class='button_to' method='post' action='/diagnoses?note=presence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}&amp;visit_id=#{@visit.id}'><button class='btn btn-success pull-right down-eight' type='submit'><i class='fa fa-plus'></i></button></form><form class='button_to' method='post' action='/diagnoses?note=absence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}&amp;visit_id=#{@visit.id}'><button class='btn btn-danger pull-right down-eight' type='submit'><i class='fa fa-minus'></i></button></form>".html_safe
      else
        render html: "<form class='button_to' method='post' action='/diagnoses?note=presence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}'><button class='btn btn-success pull-right down-eight' type='submit'><i class='fa fa-plus'></i></button></form><form class='button_to' method='post' action='/diagnoses?note=absence&amp;patient_id=#{@patient.id}&amp;topic_id=#{category.id}'><button class='btn btn-danger pull-right down-eight' type='submit'><i class='fa fa-minus'></i></button></form>".html_safe
      end

    when 'medication'
      render html: "<button type='button' class='btn btn-info pull-right down-eight' value='#{category.id}' id='med-reason' onclick='renderMedTopicForm($(this).val());'>Add medication details</button>".html_safe
    when 'stat'
      render html: "<button type='button' class='btn btn-info pull-right down-eight' value='#{category.id}' id='stat-reason' onclick='renderStatTopicForm($(this).val());'>Add vitals details</button>".html_safe
    end
  end
end
