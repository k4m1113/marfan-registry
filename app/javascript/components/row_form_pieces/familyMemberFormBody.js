import fileAttachmentButton from './fileAttachmentButton'
module.exports = function familyMemberFormBody(topic, patient, rowID) {
  let minValue = ''
  let maxValue = ''
  let today = new Date
  today = today.getFullYear()
  const patientAge = today -  parseInt(patient.date_of_birth.slice(0, 4))
  if (topic.name === "parent") {
    minValue = patientAge + 10
    maxValue = 110
  } else if (topic.name === "child") {
    minValue = 0
    maxValue = patientAge
  }
  const parameterizedPlural = 'family_members';
  let returnStatement = `
  <div class="form-group row">
    <div class="col-4 col-form-label">
      First Name
    </div>
    <div class="col-8">
      <input type="text" id="visit_${parameterizedPlural}_attributes_${rowID}_future_patient_data_hash_first_name" name="visit[${parameterizedPlural}_attributes][${rowID}][future_patient_data_hash][first_name]" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-4 col-form-label">
      Last Name
    </div>
    <div class="col-8">
      <input type="text" id="visit_${parameterizedPlural}_attributes_${rowID}_future_patient_data_hash_last_name" name="visit[${parameterizedPlural}_attributes][${rowID}][future_patient_data_hash][last_name]" class="form-control">
    </div>
  </div>
  <div class="form-group row">
    <div class="col-4 col-form-label">
      Age
    </div>
    <div class="col-8 form-inline">
      <input type="number" id="visit_${parameterizedPlural}_attributes_${rowID}_future_patient_data_hash_born_years_ago" name="visit[${parameterizedPlural}_attributes][${rowID}][future_patient_data_hash][born_years_ago]" class="form-control" min="${minValue}" max="${maxValue}" step="1">
      &nbsp
      <label>
        <input type="checkbox" class="deceased"> Deceased
      </label>
    </div>
  </div>

  <div class="deceased_details" style="display:none">
    <div class="form-group row">
      <div class="col-4 col-form-label">
        Cause of Death
      </div>
      <div class="col-8">
        <input type="text" id="visit_${parameterizedPlural}_attributes_${rowID}_future_patient_data_hash_cause_of_death" name="visit[${parameterizedPlural}_attributes][${rowID}][future_patient_data_hash][cause_of_death]" class="form-control">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <div class="col-4 col-form-label">
      Note
    </div>
    <div class="col-8 form-inline">
      <textarea placeholder='note' name='visit[${parameterizedPlural}_attributes][${rowID}][future_patient_data_hash][note]' id='visit_${parameterizedPlural}_attributes_${rowID}_future_patient_data_hash_note' class='form-control' rows="1"></textarea>
      ${fileAttachmentButton(topic, parameterizedPlural)}
    </div>
  </div>
  `
  return returnStatement
}
