import timeAgoField from './timeAgoField';
import durationField from './durationField';
import fileAttachmentButton from './fileAttachmentButton';
import keywords from './keywords';
import noteField from './noteField';
import findRelated from './findRelated';

module.exports = function assembledHospitalizationForm(topic, unsortedTopics) {
  const parameterizedPlural = 'hospitalizations'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      ${timeAgoField(topic, parameterizedPlural)}
      ${durationField(topic, parameterizedPlural)}
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
