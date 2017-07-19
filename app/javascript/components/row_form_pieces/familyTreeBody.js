import assembledFamilyMemberForm from './assembledFamilyMemberForm'
module.exports = function familyTreeBody(person, topic, field, index, patient, visit, relationship = topic.name) {
  let title = ''
  if (person) {
    switch (field) {
      case 'name':
        title = `${person.future_patient_data_hash.first_name}`
        break;
      case 'details':
        title = `${person.future_patient_data_hash.note}`
        break;
      default:

    }
  } else {
    title = `${relationship} ${field}`
  }
  const returnStatement = `<div data-target="#${relationship}${index}Modal" data-toggle="modal">
    ${title}
  </div>
  <div class="modal fade" id="${relationship}${index}Modal" tabindex="-1" role="dialog" aria-labelledby="${relationship}${index}Label" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="${relationship}${index}Label">
            ${relationship} ${index}
          </h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ${assembledFamilyMemberForm(topic, person, visit, patient)}
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">
          Save ${topic.name} ${index}
          </button>
        </div>
      </div>
    </div>
  </div>
  `
  return returnStatement
}
