import renderTimeAgoField from './timeAgoField';
import renderDurationField from './durationField';
import renderKeywords from './keywords';
import renderNoteField from './noteField';
import renderFileButton from './fileAttachmentButton';
import findRelated from './findRelated';

module.exports = function renderProcedureForm(topic, rowID = topic.id) {
  let parameterizedPlural = 'procedures'
  const returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      ${renderTimeAgoField(topic, parameterizedPlural)}
      ${renderDurationField(topic, parameterizedPlural)}
    </div>
    ${renderKeywords(topic, parameterizedPlural)}
    <div class='form-inline'>
      ${renderNoteField(topic, parameterizedPlural)}        ${renderFileButton(topic, parameterizedPlural)}
    </div>
    ${findRelated(topic)}
  </td></tr>
  `
  return returnStatement
}
