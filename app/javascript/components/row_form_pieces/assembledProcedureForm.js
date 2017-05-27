import renderTimeAgoField from './timeAgoField'
import renderDurationField from './durationField'
import renderKeywords from './keywords'
import renderNoteField from './noteField'
import renderFileButton from './fileAttachmentButton'

module.exports = function renderProcedureForm(topic) {
  const parameterizedPlural = 'procedures'
  const returnStatement = `
  <tr class='row_form' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      <div class='input-group'>
        ${renderTimeAgoField(topic, parameterizedPlural)}
        ${renderDurationField(topic, parameterizedPlural)}
      </div>
    </div>
    ${renderKeywords(topic, parameterizedPlural)}
    <div class='form-inline'>
      <div class='input-group'>
        ${renderNoteField(topic, parameterizedPlural)}
        ${renderFileButton(topic, parameterizedPlural)}
      </div>
    </div>
  </td></tr>
  `
  return returnStatement
}
