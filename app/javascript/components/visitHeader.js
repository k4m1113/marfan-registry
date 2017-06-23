const primaryDiagnoses = [
  'Marfan Syndrome',
  'Loeys-Dietz Syndrome',
  'Ehlers-Danlos Syndrome',
  'Beals Syndrome',
  'familial thoracic aneurysm and dissection',
  'ectopia lentis',
  'mass phenotype',
  'bicuspid aortic valve',
  'Stickler Syndrome',
  'Shprintzen-Goldberg Syndrome'
]

module.exports = function renderDiagnosisHeader(patient, visit) {
  let returnStatement = ''
  if (!patient.primary_diagnosis) {
    returnStatement += 'Primary Diagnosis: '
    const options = primaryDiagnoses.map(d =>
      `<label class="btn btn-primary">
        <input type="radio" autocomplete="off" name="visit[patient_attributes][primary_diagnosis]" value="${d}">
        ${d}
      </label>`
    ).join('');
    returnStatement += options
    returnStatement += `<button type="submit" class="btn btn-success btn-sm confirm-submit" data-attr="primary_diagnosis">
      <i class="fa fa-check" aria-hidden="true"></i>
    </button>`
  }
  return returnStatement;
};
