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

module.exports = function visitHeader(patient, visit) {
  let returnStatement = ''
  if (!patient.primary_diagnosis) {
    returnStatement += `<div class="alert alert-warning alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>Primary Diagnosis: `
      const options = primaryDiagnoses.map(d =>
        `<label class="btn btn-secondary">
          <input type="radio" autocomplete="off" name="visit[patient_attributes][primary_diagnosis]" value="${d}">
          ${d}
        </label>`
      ).join('');
      returnStatement += options
      returnStatement += '</div>'
  }
  return returnStatement;
};
