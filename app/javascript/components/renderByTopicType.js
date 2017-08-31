import assembledDiagnosisForm from './row_form_pieces/assembledDiagnosisForm';
import assembledDissectionForm from './row_form_pieces/assembledDissectionForm'
import assembledFamilyMemberForm from './row_form_pieces/assembledFamilyMemberForm'
import assembledGeneticTestForm from './row_form_pieces/assembledGeneticTestForm'
import assembledHeartMeasurementForm from './row_form_pieces/assembledHeartMeasurementForm';
import assembledHospitalizationForm from './row_form_pieces/assembledHospitalizationForm';
import assembledMeasurementForm from './row_form_pieces/assembledMeasurementForm'
import assembledMedicationForm from './row_form_pieces/assembledMedicationForm';
import assembledProcedureForm from './row_form_pieces/assembledProcedureForm';
import assembledVitalForm from './row_form_pieces/assembledVitalForm';

export default {
  renderByTopicType(topic, allTopics, unsortedTopics, visit, rowID) {
    let form = null
    switch (topic.topic_type) {
      case 'diagnosis':
        form = assembledDiagnosisForm(topic, allTopics, visit, rowID)
        break;
      case 'dissection':
        form = assembledDissectionForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'family member':
        form = assembledFamilyMemberForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'genetic test':
        form = assembledGeneticTestForm(topic, visit, rowID)
        break;
      case 'heart_measurement':
        form = assembledHeartMeasurementForm(topic, visit, rowID)
        break;
      case 'hospitalization':
        form = assembledHospitalizationForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'measurement':
        form = assembledMeasurementForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'medication':
        form = assembledMedicationForm(topic, visit, rowID)
        break;
      case 'procedure':
        form = assembledProcedureForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'vital':
        form = assembledVitalForm(topic, visit, rowID)
        break;
      default:
    }
    return form
  }
}
