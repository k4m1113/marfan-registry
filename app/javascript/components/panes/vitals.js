import assembledVitalForm from '../row_form_pieces/assembledVitalForm'

export default {
  vitals(topics, visit) {
    const parameterizedPlural = 'vitals'
    const fields = topics.map(t => assembledVitalForm(t, visit))
    const returnStatement = `${fields.join('')}`
    return returnStatement
  }
}
