import renderTimeAgoField from './timeAgoField'
import renderDurationField from './durationField'
import renderFrequencyField from './frequencyField'
import renderFileButton from './fileAttachmentButton'
import renderKeywords from './keywords'
import renderNoteField from './noteField'

module.exports = function renderHospitalizationForm(topic) {
  let parameterizedPlural = 'hospitalizations'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
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
