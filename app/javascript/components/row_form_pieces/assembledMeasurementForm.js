import timeAgoField from './timeAgoField';
import fileAttachmentButton from './fileAttachmentButton';
import keywords from './keywords';
import measurementField from './measurementField';
import noteField from './noteField';
import findRelated from './findRelated';

module.exports = function assembledMeasurementForm(topic) {
  const parameterizedPlural = 'hospitalizations'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      ${measurementField(topic, parameterizedPlural)}
      ${keywords(topic, parameterizedPlural)}
    </div>
    <div class='form-inline'>
      ${timeAgoField(topic, parameterizedPlural)}
    </div>
    <div class='form-inline'>
      ${noteField(topic, parameterizedPlural)}        ${fileAttachmentButton(topic, parameterizedPlural)}
    </div>
    ${findRelated(topic)}
  </td></tr>
  `
  return returnStatement
}
