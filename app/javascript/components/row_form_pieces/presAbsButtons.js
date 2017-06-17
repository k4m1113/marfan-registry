import renderInfoHover from './infoHover'
const parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations'
}
module.exports = function renderButtons(topic, visit) {
  var parameterizedPlural = parameterizedPlurals[topic.topic_type]
  const discussedConcerns = visit.concerns.map(x => x.topic_id)
  const discussed = discussedConcerns.includes(topic.id) ? ' red' : ''
  var returnStatement = `
  <tr class="main_row${discussed}">
    <input value="${visit.patient_id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][patient_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_patient_id" type="hidden">
    <input value="${visit.id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][visit_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_visit_id" type="hidden">
    <input value="${topic.id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][topic_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_topic_id" class="topic_id" type="hidden">
    <td>
      ${topic.name}
      `
      if (discussed) {
        let existing = visit.concerns.filter(x => x.topic_id == topic.id)
        returnStatement += `${renderInfoHover(existing)}`
      }
      returnStatement += `
    </td>
    <div class="btn-group" data-toggle="buttons">
    <td>
      <label class="btn">
        <input name="visit[${parameterizedPlural}_attributes][${topic.id}][present]" id="visit_${parameterizedPlural}_attributes_${topic.id}_present_true" class="pres_abs" type="radio" value="true"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-check-circle-o fa-2x"></i>
      </label>
    </td>
    <td>
      <label class="btn">
        <input name="visit[${parameterizedPlural}_attributes][${topic.id}][present]" id="visit_${parameterizedPlural}_attributes_${topic.id}_present_false" class="pres_abs" type="radio" value="false"><i class="fa fa-circle-o fa-2x"></i><i class="fa fa-check-circle-o fa-2x"></i>
      </label>
    </td>
    </div>
  </tr>
  `
  return returnStatement
}
