import presAbsButtons from './presAbsButtons'
import assembledProcedureForm from './assembledProcedureForm';
import assembledDiagnosisForm from './assembledDiagnosisForm';
import assembledHospitalizationForm from './assembledHospitalizationForm';
import assembledMedicationForm from './assembledMedicationForm';
import assembledDissectionForm from './assembledDissectionForm'
import assembledGeneticTestForm from './assembledGeneticTestForm'

const parameterizedPlurals = require('./parameterizedPlurals')

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
    case "genetic test":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledGeneticTestForm(topic)}`;
      break;
    case "hospitalization":
      returnStatement += `${presAbsButtons(topic, visit)}`;
      returnStatement += `${assembledHospitalizationForm(topic)}`;
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
