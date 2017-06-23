import renderProcedureForm from './assembledProcedureForm';
import renderDiagnosisForm from './assembledDiagnosisForm';
import renderHospitalizationForm from './assembledHospitalizationForm';
import renderMedicationForm from './assembledMedicationForm';
import renderButtons from './presAbsButtons'
import renderDissectionForm from './assembledDissectionForm'

const parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations',
  'vital': 'vitals',
  'dissection': 'dissections'
}

// runs formRender function according to topic type
module.exports = function renderRowForm(topic, visit) {
  const pp = parameterizedPlurals[topic.topic_type];
  let returnStatement = ``

  switch (topic.topic_type) {
    case "diagnosis":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderDiagnosisForm(topic)}`;
      break;
    case "dissection":
    returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderDissectionForm(topic, visit)}`;
      break;
    case "family member":
      returnStatement += `FAMILY MEMBER FORM`;
      break;
    case "hospitalization":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderHospitalizationForm(topic)}`;
      break;
    case "medication":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderMedicationForm(topic)}`;
      break;
    case "procedure":
      returnStatement += `${renderButtons(topic, visit)}`;
      returnStatement += `${renderProcedureForm(topic)}`;
      break;
    case "vital":
      "kat"
      break;
    case "heart_measurement":
      "brian"
      break;
    default:
  };
  return returnStatement;
}
