import renderMeasurementField from '../row_form_pieces/measurementField'

module.exports = function renderVitalsFields(topics, visit) {
  let returnStatement = `<br />`
  const parameterizedPlural = 'vitals'
  let fields = topics.map(t => renderMeasurementField(t, parameterizedPlural))
  returnStatement += fields.join('')
  return returnStatement
}
