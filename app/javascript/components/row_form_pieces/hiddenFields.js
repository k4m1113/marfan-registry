const parameterizedPlurals = require('./parameterizedPlurals')
module.exports = function hiddenFields(visit, topic, parameterizedPlural = parameterizedPlurals[topic.topic_type]) {
  let returnStatement = ''
  returnStatement += `<input value="${visit.patient_id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][patient_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_patient_id" type="hidden">
  <input value="${visit.id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][visit_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_visit_id" type="hidden">
  <input value="${topic.id}" name="visit[${parameterizedPlural}_attributes][${topic.id}][topic_id]" id="visit_${parameterizedPlural}_attributes_${topic.id}_topic_id" class="topic_id" type="hidden">`
  return returnStatement
}
