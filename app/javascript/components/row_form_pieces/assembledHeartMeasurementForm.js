import fileAttachmentButton from './fileAttachmentButton'
import hiddenFields from './hiddenFields'
import measurementField from './measurementField'
import keywords from './keywords'
import noteField from './noteField'

module.exports = function assembledHeartMeasurementForm(topic, visit, rowID = topic.id) {
  const parameterizedPlural = 'heart_measurements'
  let returnStatement = `<div class="form-group row">
  <div class="col-3 col-form-label">
    ${topic.name}
  </div>
  <div class="col-9 form-inline">
    ${hiddenFields(visit, topic, parameterizedPlural)}`
  if (topic.units_of_measurement.length == 1 || !topic.name.includes('morphology')) {
    returnStatement += `${measurementField(topic, parameterizedPlural, null, 'severity')}`
  } else {
    returnStatement += `${measurementField(topic, parameterizedPlural, ' multiple', 'morphology')}`
  }
  if (topic.descriptors) {
    returnStatement += `${keywords(topic, parameterizedPlural)}`
  }
  returnStatement += `${noteField(topic, parameterizedPlural)}${fileAttachmentButton(topic, parameterizedPlural)}</div></div>`
  return returnStatement
}
