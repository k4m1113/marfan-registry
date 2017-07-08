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
    <div class="form-group row">
      <label class="col-2 col-form-label">Date</label>
      <div class='form-inline col-10'>
        ${timeAgoField(topic, parameterizedPlural)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Descriptors</label>
      <div class="form-inline col-10">
        ${keywords(topic, parameterizedPlural)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Note</label>
      <div class="form-inline col-10">
        ${noteField(topic, parameterizedPlural)}        ${fileAttachmentButton(topic, parameterizedPlural)}
      </div>
    </div>
    ${findRelated(topic, unsortedTopics)}
  </td></tr>
  `
  return returnStatement
}
