import findRelated from './findRelated';
import hiddenFields from './hiddenFields';
import medFormFields from './medFormFields';

module.exports = function assembledMedicationForm(topic, visit, rowID = topic.id) {
  const parameterizedPlural = 'medications'
  const returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    ${hiddenFields(visit, topic, parameterizedPlural, rowID)}
    ${medFormFields(topic, rowID)}
  </td></tr>
  `
  return returnStatement
}
