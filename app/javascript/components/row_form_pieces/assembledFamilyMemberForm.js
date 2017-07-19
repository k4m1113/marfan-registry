import hiddenFields from './hiddenFields'
import familyMemberFormBody from './familyMemberFormBody'
module.exports = function assembledFamilyMemberForm(topic, person, visit, patient) {
  const rowID = Math.floor(Math.random() * 1000) + 2000
  let returnStatement = ''
  if (person) {
    returnStatement = person.future_patient_data_hash.first_name
  } else {
    returnStatement = `
    ${hiddenFields(visit, topic, 'family_members', rowID)}
    ${familyMemberFormBody(topic, patient, rowID)}
    `;
  }
  return returnStatement;
}
