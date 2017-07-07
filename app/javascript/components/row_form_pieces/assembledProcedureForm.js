import timeAgoField from './timeAgoField';
import durationField from './durationField';
import keywords from './keywords';
import noteField from './noteField';
import fileAttachmentButton from './fileAttachmentButton';
import findRelated from './findRelated';

module.exports = function assembledProcedureForm(topic, unsortedTopics, rowID = topic.id) {
  let parameterizedPlural = 'procedures'
  const returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      ${timeAgoField(topic, parameterizedPlural)}
    </div>
    ${keywords(topic, parameterizedPlural)}
    <div class='form-inline'>
      ${noteField(topic, parameterizedPlural)}        ${fileAttachmentButton(topic, parameterizedPlural)}
    </div>
    ${findRelated(topic, unsortedTopics)}
  </td></tr>
  `
  return returnStatement
}
