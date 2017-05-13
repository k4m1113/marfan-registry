function renderRowForm(topic, descriptors) {
  plural_select_options = `<option>second(s)</option>
  <option>minute(s)</option>
  <option>hour(s)</option>
  <option>day(s)</option>
  <option>week(s)</option>
  <option>month(s)</option>
  <option>year(s)</option>`
  singular_select_options = `<option>second</option>
  <option>minute</option>
  <option>hour</option>
  <option>day</option>
  <option>week</option>
  <option>month</option>
  <option>year</option>`
  keywords = ``
  if (descriptors[0].length) {
    keywords += `<div class="form-inline">`
    for (var i = 0; i < descriptors.length; i++) {
      keywords += `<div class="form-check form-check-inline">
        <label class="form-check-label">
          <input class="form-check-input" type="checkbox" name="visit[diagnoses_attributes][${topic}][descriptors][]" id="visit_diagnoses_attributes_${topic}_descriptors_${descriptors[i]}" value="${descriptors[i]}">
          ${descriptors[i]}
        </label>
      </div>`
    };
    keywords += '</div>'
  }
  debugger
  return `<tr class="row_form"><td colspan="3">
    <div class="form-inline">
      <div class="input-group">
        <input type="number" name="visit[diagnoses_attributes][${topic}][time_ago_amount]" id="visit_diagnoses_attributes_${topic}_time_ago_amount" class="form-control" placeholder="time ago">
        <select name="visit[diagnoses_attributes][${topic}][time_ago_scale]" id="visit_diagnoses_attributes_${topic}_time_ago_scale" class="form-control">
          ${plural_select_options}
        </select>
        <label for="visit_diagnoses_attributes_${topic}_time_ago_scale">
          ago
        </label>
        <label for="visit_diagnoses_attributes_${topic}_duration_amount">
           for
        </label>
        <input type="number" name="visit[diagnoses_attributes][${topic}][duration_amount]" id="visit_diagnoses_attributes_${topic}_duration_amount" class="form-control" placeholder="duration">
        <select name="visit[diagnoses_attributes][${topic}][duration_scale]" id="visit_diagnoses_attributes_${topic}_duration_scale" class="form-control">
          ${plural_select_options}
        </select>
        ,
        <input type="number" name="visit[diagnoses_attributes][${topic}][frequency_amount]" id="visit_diagnoses_attributes_${topic}_frequency_amount" class="form-control" placeholder="frequency">
        <label for="visit_diagnoses_attributes_${topic}_frequency_amount">
           times per
        </label>
        <select name="visit[diagnoses_attributes][${topic}][frequency_scale]" id="visit_diagnoses_attributes_${topic}_frequency_scale" class="form-control">
          ${singular_select_options}
        </select>
      </div>
    </div>
    ${keywords}
    <div class="form-inline">
      <div class="input-group">
        <input type="textarea" placeholder="note" name="visit[diagnoses_attributes][${topic}][note]" id="visit_diagnoses_attributes_${topic}_note" class="form-control">
      </div>
    </div>
    </td></tr>`
}
