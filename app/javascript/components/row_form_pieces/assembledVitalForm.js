import hiddenFields from './hiddenFields'
import measurementField from './measurementField'

module.exports = function assembledVitalForm(topic, visit) {
  const parameterizedPlural = 'vitals'
  let returnStatement = `${hiddenFields(visit, topic, parameterizedPlural)}`
  returnStatement += `${measurementField(topic, parameterizedPlural)}`

  return returnStatement
}
