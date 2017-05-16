function renderRowForm(topic, descriptors) {
  plural_select_options = "<option>second(s)</option><option>minute(s)</option><option>hour(s)</option><option>day(s)</option><option>week(s)</option><option>month(s)</option><option>year(s)</option>"
  singular_select_options = "<option>second</option><option>minute</option><option>hour</option><option>day</option><option>week</option><option>month</option><option>year</option>"
  keywords = ""
  if (descriptors[0].length) {
    keywords += "<div class='form-inline'>"
    for (var i = 0; i < descriptors.length; i++) {
      keywords += "<div class='form-check form-check-inline'>"
          keywords += "<label class='form-check-label'>"
            keywords += "<input class='form-check-input' type='checkbox' name='visit[diagnoses_attributes][" + topic + "][descriptors][]' id='visit_diagnoses_attributes_" + topic + "_descriptors_" + descriptors[i] + "' value='" + descriptors[i] + "'>"
            keywords += descriptors[i]
          keywords += "</label>"
        keywords += "</div>"
    };
    keywords += '</div>'
  }
  return_statement = "<tr class='row_form'><td colspan='3'>"
    return_statement += "<div class='form-inline'>"
      return_statement += "<div class='input-group'>"
        return_statement += "<input type='number' name='visit[diagnoses_attributes][" + topic + "][time_ago_amount]' id='visit_diagnoses_attributes_" + topic + "_time_ago_amount' class='form-control' placeholder='time ago'>"
        return_statement += "<select name='visit[diagnoses_attributes][" + topic + "][time_ago_scale]' id='visit_diagnoses_attributes_" + topic + "_time_ago_scale' class='form-control'>"
          return_statement += plural_select_options
        return_statement += "</select>"
        return_statement += "<label for='visit_diagnoses_attributes_" + topic + "_time_ago_scale'>"
          return_statement += "ago"
        return_statement += "</label>"
        return_statement += "<label for='visit_diagnoses_attributes_" + topic + "_duration_amount'>"
           return_statement += "for"
        return_statement += "</label>"
        return_statement += "<input type='number' name='visit[diagnoses_attributes][" + topic + "][duration_amount]' id='visit_diagnoses_attributes_" + topic + "_duration_amount' class='form-control' placeholder='duration'>"
        return_statement += "<select name='visit[diagnoses_attributes][" + topic + "][duration_scale]' id='visit_diagnoses_attributes_" + topic + "_duration_scale' class='form-control'>"
          return_statement += plural_select_options
        return_statement += "</select>"
        return_statement += ","
        return_statement += "<input type='number' name='visit[diagnoses_attributes]["+ topic + "][frequency_amount]' id='visit_diagnoses_attributes_" + topic + "_frequency_amount' class='form-control' placeholder='frequency'>"
        return_statement += "<label for='visit_diagnoses_attributes_" + topic + "_frequency_amount'>"
           return_statement += "times per"
        return_statement += "</label>"
        return_statement += "<select name='visit[diagnoses_attributes][" + topic + "][frequency_scale]' id='visit_diagnoses_attributes_" + topic + "_frequency_scale' class='form-control'>"
          return_statement += singular_select_options
        return_statement += return_statement += "</select>"
      return_statement += "</div>"
    return_statement += "</div>"
    return_statement += keywords
    return_statement += "<div class='form-inline'>"
      return_statement += "<div class='input-group'>"
        return_statement += "<input type='textarea' placeholder='note' name='visit[diagnoses_attributes][" + topic + "][note]' id='visit_diagnoses_attributes_" + topic + "_note' class='form-control'>"
      return_statement += "</div>"
    return_statement += "</div>"
  return_statement += "</td></tr>"
  return return_statement
}
