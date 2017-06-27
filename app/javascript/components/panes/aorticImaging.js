import renderHeartMeasurementForm from '../row_form_pieces/assembledHeartMeasurementForm'

module.exports = function aorticImaging(topics, visit){
  const parameterizedPlural = 'heart_measurements'
  const fields = topics.map(t => renderHeartMeasurementForm(t, visit))
  let returnStatement = '<div class="row">'
  returnStatement += `${fields.join('')}`
  returnStatement += '</div>'
  return returnStatement
}
