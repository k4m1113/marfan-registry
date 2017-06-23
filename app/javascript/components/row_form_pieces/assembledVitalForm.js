import renderHiddenFields from './hiddenFields'
import renderMeasurementField from './measurementField'

module.exports = function renderVitalForm(topic, visit) {
  const parameterizedPlural = 'vitals'
  let returnStatement = `${renderHiddenFields(visit, topic, parameterizedPlural)}`
  returnStatement += `${renderMeasurementField(topic, parameterizedPlural)}`

  return returnStatement
}
