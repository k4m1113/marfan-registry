const parameterizedPlurals = require('./parameterizedPlurals')
module.exports = function hiddenFields(visit, topic, parameterizedPlural = parameterizedPlurals[topic.topic_type], rowID = rowID) {
  let returnStatement = ''
  returnStatement += `<input value="${visit.patient_id}" name="visit[${parameterizedPlural}_attributes][${rowID}][patient_id]" id="visit_${parameterizedPlural}_attributes_${rowID}_patient_id" type="hidden">
  <input value="${visit.id}" name="visit[${parameterizedPlural}_attributes][${rowID}][visit_id]" id="visit_${parameterizedPlural}_attributes_${rowID}_visit_id" type="hidden">
  <input value="${topic.id}" name="visit[${parameterizedPlural}_attributes][${rowID}][topic_id]" id="visit_${parameterizedPlural}_attributes_${rowID}_topic_id" class="topic_id" type="hidden">`
  return returnStatement
}
