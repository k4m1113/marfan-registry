import renderHiddenFields from './hiddenFields'
import renderMeasurementField from './measurementField'
import renderKeywords from './keywords'
import noteField from './noteField'
import fileAttachmentButton from './fileAttachmentButton'

module.exports = function renderHeartMeasurementForm(topic, visit) {
  const parameterizedPlural = 'heart_measurements'
  let returnStatement = `<div class="col-sm-12"><div class="card">
  <div class="card-header">
    ${topic.name}
  </div>
  <div class="form-inline">${renderHiddenFields(visit, topic, parameterizedPlural)}`
  if (topic.units_of_measurement.length == 1 || !topic.name.includes('morphology')) {
    returnStatement += `<div class="form-inline">
      ${renderMeasurementField(topic, parameterizedPlural, null, 'severity')}
    </div>`
  } else {
    returnStatement += `${renderMeasurementField(topic, parameterizedPlural, ' multiple', 'morphology')}`
  }
  if (topic.descriptors) {
    returnStatement += `${renderKeywords(topic, parameterizedPlural)}`
  }
  returnStatement += `${noteField(topic, parameterizedPlural)}${fileAttachmentButton(topic, parameterizedPlural)}</div></div></div>`
  return returnStatement
}
