import renderTimeAgoField from './timeAgoField'
import renderDurationField from './durationField'
import renderFrequencyField from './frequencyField'
import renderKeywords from './keywords'
import renderNoteField from './noteField'

module.exports = function renderProcedureForm(topic, descriptors, parameterizedPlural) {
  const returnStatement = `
  <tr class='row_form'><td colspan='4'>
    <div class='form-inline'>
      <div class='input-group'>
        ${renderTimeAgoField(topic, parameterizedPlural)}
        ${renderDurationField(topic, parameterizedPlural)}
      </div>
    </div>
    ${renderKeywords(topic, descriptors, parameterizedPlural)}
    ${renderNoteField(topic, parameterizedPlural)}
  </td></tr>
  `
  return returnStatement
}
