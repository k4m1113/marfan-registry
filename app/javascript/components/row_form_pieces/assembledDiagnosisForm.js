import durationField from './durationField';
import fileAttachmentButton from './fileAttachmentButton';
import findRelated from './findRelated';
import frequencyField from './frequencyField';
import hiddenFields from './hiddenFields';
import keywords from './keywords';
import noteField from './noteField';
import timeAgoField from './timeAgoField';

module.exports = function assembledDiagnosisForm(topic, allTopics, visit, rowID = topic.id) {
  const parameterizedPlural = 'diagnoses'
  let returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
  ${hiddenFields(visit, topic, parameterizedPlural, rowID)}`
  if (topic.descriptors) {
    returnStatement += `<div class="form-group row">
      <label class="col-2 col-form-label">Descriptors</label>
      <div class="form-inline col-10">
        ${keywords(topic, parameterizedPlural)}
      </div>
    </div>`
  }
  returnStatement += `<div class="form-group row">
      <label class="col-2 col-form-label">Date</label>
      <div class='form-inline col-10'>
        ${timeAgoField(topic, parameterizedPlural, rowID)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Duration</label>
      <div class="form-inline col-10">
        ${durationField(topic, parameterizedPlural, rowID)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Frequency</label>
      <div class="form-inline col-10">
        ${frequencyField(topic, parameterizedPlural, rowID)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Note</label>
      <div class="form-inline col-10">
        ${noteField(topic, parameterizedPlural, rowID)}
        ${fileAttachmentButton(topic, parameterizedPlural, rowID)}
      </div>
    </div>
    ${findRelated(topic, allTopics)}
  </td></tr>
  `
  return returnStatement
}
