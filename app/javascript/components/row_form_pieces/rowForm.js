import pluralSelectOptions from './pluralSelectOptions';
import singularSelectOptions from './singularSelectOptions';
import renderProcedureForm from './assembledProcedureForm';
import renderDiagnosisForm from './assembledDiagnosisForm';
import renderHospitalizationForm from './assembledHospitalizationForm';

const parameterizedPlurals = {
  'diagnosis': 'diagnoses',
  'family member': 'family_members',
  'procedure': 'procedures',
  'medication': 'medications',
  'hospitalization': 'hospitalizations'
}
function renderMedicationForm(topic) {
  [
    "<tr class='row_form'><td colspan='4'>",

  ]
  return_statement = "<tr class='row_form'><td colspan='4'>"
}

// runs formRender function according to topic type
function renderRowForm(topic, descriptors, allTopics) {
  switch (allTopics[topic]) {
    case "family member":
      k = "kamille"
      break;
    case "diagnosis":
      return renderDiagnosisForm(topic, descriptors, parameterizedPlurals['diagnosis']);
      break;
    case "hospitalization":
      return renderHospitalizationForm(topic, descriptors, parameterizedPlurals['hospitalization'])
      break;
    case "procedure":
      return renderProcedureForm(topic, descriptors, parameterizedPlurals['procedure']);
      break;
    case "vital":
      "kat"
      break;
    case "medication":
      "brian"
      break;
    default:
      console.log('default');
  }
}
