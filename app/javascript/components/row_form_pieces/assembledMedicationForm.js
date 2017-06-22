import renderMedFormBody from './medFormFields'
import findRelated from './findRelated'

module.exports = function renderMedicationForm(topic) {
  let parameterizedPlural = 'medications'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
    ${renderMedFormBody(topic)}
  </td></tr>
  `
  return returnStatement
}
