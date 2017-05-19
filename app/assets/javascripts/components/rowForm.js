plural_select_options = "<option>second(s)</option><option>minute(s)</option><option>hour(s)</option><option>day(s)</option><option>week(s)</option><option>month(s)</option><option>year(s)</option>"
singular_select_options = "<option>second</option><option>minute</option><option>hour</option><option>day</option><option>week</option><option>month</option><option>year</option>"
parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations'
}


function renderTimeAgoFields(topic, parameterizedPlural) {
  return_statement = [
    "<div class='input-group'>",
      "<input type='number' name='visit[" + parameterizedPlural + "_attributes][" + topic + "][time_ago_amount]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_time_ago_amount' class='form-control' placeholder='time ago'>",
      "<span class='input-group-btn'>",
        "<button class='btn btn-primary' type='button' id='" + parameterizedPlural + "_" +  topic + "_calc_button'><i class='fa fa-calculator'></i></button>",
      "</span>",
      "<select name='visit[" + parameterizedPlural + "_attributes][" + topic + "][time_ago_scale]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_time_ago_scale' class='form-control'>",
        plural_select_options,
      "</select>",
      "<label for='visit_" + parameterizedPlural + "_attributes_" + topic + "_time_ago_scale'>",
      "ago",
      "</label>",
    "</div>"
  ];
  $('#visit_' + parameterizedPlural + '_attributes_' + topic + '_time_ago_amount').addKeyboard();
  $('#' + parameterizedPlural + '_' + topic + '_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb = $('#visit_' + parameterizedPlural + '_attributes_' + topic + '_time_ago_amount').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb.isOpen ) {
      kb.close();
    } else {
      kb.reveal();
    }
  });
  return return_statement.join('')
}
function renderDurationFields(topic, parameterizedPlural) {
  return_statement = [
    "<div class='input-group'",
      "<label for='visit_" + parameterizedPlural + "_attributes_" + topic + "_duration_amount'>",
      "for",
      "</label>",
      "<input type='number' name='visit[" + parameterizedPlural + "_attributes][" + topic + "][duration_amount]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_duration_amount' class='form-control' placeholder='duration'>",
      "<select name='visit[" + parameterizedPlural + "_attributes][" + topic + "][duration_scale]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_duration_scale' class='form-control'>",
        plural_select_options,
      "</select>",
    "</div>"
  ]
  return return_statement.join('')
}
function renderFrequencyFields(topic, parameterizedPlural) {
  return_statement = [
    "<div class='input-group'",
      "<label for='visit_" + parameterizedPlural + "_attributes_" + topic + "_frequency_amount'>",
      "</label>",
      "<input type='number' name='visit[" + parameterizedPlural + "_attributes][" + topic + "][frequency_amount]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_frequency_amount' class='form-control' placeholder='frequency'>",
      'times per',
      "<select name='visit[" + parameterizedPlural + "_attributes][" + topic + "][frequency_scale]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_frequency_scale' class='form-control'>",
        plural_select_options,
      "</select>",
    "</div>"
  ]
  return return_statement.join('')
}
function renderKeywords(topic, descriptors, parameterizedPlural) {
  keywords = []
  if (descriptors[0].length) {
    keywords.push("<div class='form-inline'>")
    for (var i = 0; i < descriptors.length; i++) {
      keywords.push("<div class='form-check form-check-inline'>")
      keywords.push("<label class='form-check-label'>")
      keywords.push("<input class='form-check-input' type='checkbox' name='visit[" + parameterizedPlural + "_attributes][" + topic + "][descriptors][]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_descriptors_" + descriptors[i] + "' value='" + descriptors[i] + "'>")
      keywords.push(descriptors[i])
      keywords.push("</label>")
      keywords.push("</div>")
    };
    keywords.push('</div>')
  }
  return keywords.join('')
}
function renderNoteField(topic, parameterizedPlural) {
  return_statement = [
    "<div class='form-inline'>",
      "<div class='input-group'>",
        "<input type='textarea' placeholder='note' name='visit[" + parameterizedPlural + "_attributes][" + topic + "][note]' id='visit_" + parameterizedPlural + "_attributes_" + topic + "_note' class='form-control'>",
      "</div>",
    "</div>"
  ]
  return return_statement.join('')
}

function renderDiagnosisForm(topic, descriptors, parameterizedPlural) {
  return_statement =
  [
    "<tr class='row_form'><td colspan='3'>",
      "<div class='form-inline'>",
        "<div class='input-group'>",
          renderTimeAgoFields(topic, parameterizedPlural),
          renderDurationFields(topic, parameterizedPlural),
          ",",
          renderFrequencyFields(topic, parameterizedPlural),
        "</div>",
      "</div>",
      renderKeywords(topic, descriptors, parameterizedPlural),
      renderNoteField(topic, parameterizedPlural),
    "</td></tr>"
  ]
  return return_statement.join('')
}
function renderProcedureForm(topic, descriptors, parameterizedPlural) {
  return_statement =
  [
    "<tr class='row_form'><td colspan='3'>",
      "<div class='form-inline'>",
        "<div class='input-group'>",
          renderTimeAgoFields(topic, parameterizedPlural),
        "</div>",
      "</div>",
      renderKeywords(topic, descriptors, parameterizedPlural),
      renderNoteField(topic, parameterizedPlural),
    "</td></tr>"
  ]
  return return_statement.join('')
}

function renderHospitalizationForm(topic, descriptors, parameterizedPlural) {
  return_statement =
  [
    "<tr class='row_form'><td colspan='3'>",
      "<div class='form-inline'>",
        "<div class='input-group'>",
          renderTimeAgoFields(topic, parameterizedPlural),
          renderDurationFields(topic, parameterizedPlural),
        "</div>",
      "</div>",
      renderKeywords(topic, descriptors, parameterizedPlural),
      renderNoteField(topic, parameterizedPlural),
    "</td></tr>"
  ]
  return return_statement.join('')
}

function renderMedicationForm(topic) {
  [
    "<tr class='row_form'><td colspan='3'>",

  ]
  return_statement = "<tr class='row_form'><td colspan='3'>"
}

// runs formRender function according to topic type
function renderRowForm(topic, descriptors, allTopics) {
  switch (allTopics[topic]) {
    case "family member":
      k = "kamille"
      break;
    case "diagnosis":
      return renderDiagnosisForm(topic, descriptors, parameterizedPlurals['diagnosis']);
      break;
    case "hospitalization":
      break;
    case "procedure":
      return renderProcedureForm(topic, descriptors, parameterizedPlurals['procedure']);
      break;
    case "vital":
      "kat"
      break;
    case "medication":
      "brian"
      break;
    default:
      console.log('default');
  }
}
