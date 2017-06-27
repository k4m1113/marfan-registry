import medFormFields from './medFormFields'
import findRelated from './findRelated'

module.exports = function assembledMedicationForm(topic) {
  let parameterizedPlural = 'medications'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
    ${medFormFields(topic)}
  </td></tr>
  `
  return returnStatement
}
