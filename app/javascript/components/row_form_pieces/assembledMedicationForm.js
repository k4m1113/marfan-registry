import renderTimeAgoField from './timeAgoField'
import renderDurationField from './durationField'
import renderMedFormBody from './medFormFields'
import renderNoteField from './noteField'

module.exports = function renderMedicationForm(topic) {
  const parameterizedPlural = 'medications'
  const returnStatement = `
  <tr class='row_form' style='display:none'><td colspan='3'>
    ${renderMedFormBody(topic)}
  </td></tr>
  `
  return returnStatement
}
