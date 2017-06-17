import renderProcedureForm from './assembledProcedureForm';
import renderDiagnosisForm from './assembledDiagnosisForm';
import renderFamilyMemberForm from './assembledFamilyMemberForm';
import renderHospitalizationForm from './assembledHospitalizationForm';
import renderMedicationForm from './assembledMedicationForm';
import renderButtons from './presAbsButtons'

const parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations'
}

// runs formRender function according to topic type
module.exports = function renderRowForm(topic, visit) {
  const pp = parameterizedPlurals[topic.topic_type];
  let returnStatement = ``

  switch (topic.topic_type) {
    case "family member":
      returnStatement += `${renderFamilyMemberForm(topic)}`;
      break;
    case "diagnosis":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderDiagnosisForm(topic)}`;
      break;
    case "hospitalization":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderHospitalizationForm(topic)}`;
      break;
    case "procedure":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderProcedureForm(topic)}`;
      break;
    case "vital":
      "kat"
      break;
    case "heart_measurement":
      "kat"
      break;
    case "medication":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderMedicationForm(topic)}`;
      break;
    default:
  };
  return returnStatement;
}
