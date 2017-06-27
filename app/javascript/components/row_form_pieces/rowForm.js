import assembledProcedureForm from './assembledProcedureForm';
import assembledDiagnosisForm from './assembledDiagnosisForm';
import renderHospitalizationForm from './assembledHospitalizationForm';
import assembledMedicationForm from './assembledMedicationForm';
import presAbsButtons from './presAbsButtons'
import assembledDissectionForm from './assembledDissectionForm'

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
module.exports = function rowForm(topic, visit) {
  const pp = parameterizedPlurals[topic.topic_type];
  let returnStatement = ``

  switch (topic.topic_type) {
    case "diagnosis":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledDiagnosisForm(topic)}`;
      break;
    case "dissection":
    returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledDissectionForm(topic, visit)}`;
      break;
    case "family member":
      returnStatement += `FAMILY MEMBER FORM`;
      break;
    case "hospitalization":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${renderHospitalizationForm(topic)}`;
      break;
    case "medication":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledMedicationForm(topic)}`;
      break;
    case "procedure":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledProcedureForm(topic)}`;
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
