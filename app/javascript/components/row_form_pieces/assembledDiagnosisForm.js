import timeAgoField from './timeAgoField';
import durationField from './durationField';
import frequencyField from './frequencyField';
import keywords from './keywords';
import noteField from './noteField';
import fileAttachmentButton from './fileAttachmentButton';
import findRelated from './findRelated'

module.exports = function assembledDiagnosisForm(topic, allTopics, rowID = topic.id) {
  const parameterizedPlural = 'diagnoses'
  const returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    <div class="form-group row">
      <label class="col-2 col-form-label">Date</label>
      <div class='form-inline col-10'>
        ${timeAgoField(topic, parameterizedPlural)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Duration</label>
      <div class="form-inline col-10">
        ${durationField(topic, parameterizedPlural)}
      </div>
    </div>
    <div class="form-group row">
      <label class="col-2 col-form-label">Frequency</label>
      <div class="form-inline col-10">
        ${frequencyField(topic, parameterizedPlural)}
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
        ${noteField(topic, parameterizedPlural)}
        ${fileAttachmentButton(topic, parameterizedPlural)}
      </div>
    </div>
    ${findRelated(topic, allTopics)}
  </td></tr>
  `
  return returnStatement
}
