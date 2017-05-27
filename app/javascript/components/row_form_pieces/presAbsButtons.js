const parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations'
}
module.exports = function renderButtons(topic) {
  var parameterizedPlural = parameterizedPlurals[topic.topic_type]
  var returnStatement = `
  <tr class="main_row">
    <input value="1" name="visit[${parameterizedPlural}_attributes][${topic.id}][patient_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_patient_id" type="hidden">
    <input value="5" name="visit[${parameterizedPlural}_attributes][${topic.id}][visit_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_visit_id" type="hidden">
    <input value="${topic.id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][topic_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_topic_id" class="topic_id" type="hidden">
    <td>
      ${topic['name']}
    </td>
    <td>
      <input name="visit[${parameterizedPlural}_attributes][${topic.id}][present]" id="visit_${parameterizedPlural}_attributes_${topic.id}_present_true" class="pres_abs" type="radio" value="true">
    </td>
    <td>
      <input name="visit[${parameterizedPlural}_attributes][${topic.id}][present]" id="visit_${parameterizedPlural}_attributes_${topic.id}_present_false" class="pres_abs" type="radio" value="false">
    </td>
  </tr>
  `
  return returnStatement
}
