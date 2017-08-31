import assembledHeartMeasurementForm from '../row_form_pieces/assembledHeartMeasurementForm'

export default {
  aorticImaging(topics, visit){
    const parameterizedPlural = 'heart_measurements'
    const fields = topics.map(t => assembledHeartMeasurementForm(t, visit))
    let returnStatement = ''
    returnStatement += `${fields.join('')}`
    return returnStatement
  }
}
