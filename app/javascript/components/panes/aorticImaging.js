import renderHeartMeasurementForm from '../row_form_pieces/assembledHeartMeasurementForm'

module.exports = function renderAorticImagingFields(topics, visit){
  const parameterizedPlural = 'heart_measurements'
  const fields = topics.map(t => renderHeartMeasurementForm(t, visit))
  let returnStatement = '<div class="form-group">'
  returnStatement += `${fields.join('')}`
  returnStatement += '</div>'
  return returnStatement
}
