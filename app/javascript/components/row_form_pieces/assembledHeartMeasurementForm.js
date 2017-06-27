import hiddenFields from './hiddenFields'
import measurementField from './measurementField'
import keywords from './keywords'
import noteField from './noteField'
import fileAttachmentButton from './fileAttachmentButton'

module.exports = function renderHeartMeasurementForm(topic, visit) {
  const parameterizedPlural = 'heart_measurements'
  let returnStatement = `<div class="col-sm-12"><div class="card">
  <div class="card-header">
    ${topic.name}
  </div>
  <div class="form-inline">${hiddenFields(visit, topic, parameterizedPlural)}`
  if (topic.units_of_measurement.length == 1 || !topic.name.includes('morphology')) {
    returnStatement += `<div class="form-inline">
      ${measurementField(topic, parameterizedPlural, null, 'severity')}
    </div>`
  } else {
    returnStatement += `${measurementField(topic, parameterizedPlural, ' multiple', 'morphology')}`
  }
  if (topic.descriptors) {
    returnStatement += `${keywords(topic, parameterizedPlural)}`
  }
  returnStatement += `${noteField(topic, parameterizedPlural)}${fileAttachmentButton(topic, parameterizedPlural)}</div></div></div>`
  return returnStatement
}
