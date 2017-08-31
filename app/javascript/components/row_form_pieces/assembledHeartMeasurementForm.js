import fileAttachmentButton from './fileAttachmentButton'
import hiddenFields from './hiddenFields'
import measurementField from './measurementField'
import keywords from './keywords'
import noteField from './noteField'

export default {
  assembledHeartMeasurementForm(topic, visit, rowID = topic.id) {
    const parameterizedPlural = 'heart_measurements'
    let returnStatement = `<div class="form-group row">
    <div class="col-3 col-form-label">
      ${topic.name}
    </div>
    <div class="col-9 form-inline">
      ${hiddenFields(visit, topic, parameterizedPlural, rowID)}`
    if (topic.units_of_measurement.length == 1 || !topic.name.includes('morphology')) {
      returnStatement += `${measurementField(topic, parameterizedPlural, null, 'severity', rowID)}`
    } else {
      returnStatement += `${measurementField(topic, parameterizedPlural, ' multiple', 'morphology', rowID)}`
    }
    if (topic.descriptors) {
      returnStatement += `${keywords(topic, parameterizedPlural, rowID)}`
    }
    returnStatement += `${noteField(topic, parameterizedPlural, rowID)}${fileAttachmentButton(topic, parameterizedPlural, rowID)}</div></div>`
    return returnStatement
  }
}
