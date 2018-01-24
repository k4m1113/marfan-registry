import AssembledDiagnosisForm from './row_form_pieces/AssembledDiagnosisForm';
import AssembledDissectionForm from './row_form_pieces/AssembledDissectionForm'
import AssembledFamilyMemberForm from './row_form_pieces/AssembledFamilyMemberForm'
import AssembledGeneticTestForm from './row_form_pieces/AssembledGeneticTestForm'
import AssembledHeartMeasurementForm from './row_form_pieces/AssembledHeartMeasurementForm';
import AssembledHospitalizationForm from './row_form_pieces/AssembledHospitalizationForm';
import AssembledMeasurementForm from './row_form_pieces/AssembledMeasurementForm'
import AssembledMedicationForm from './row_form_pieces/AssembledMedicationForm';
import AssembledProcedureForm from './row_form_pieces/AssembledProcedureForm';
import AssembledVitalForm from './row_form_pieces/AssembledVitalForm';

export default {
  renderByTopicType(topic, allTopics, unsortedTopics, visit, rowID) {
    let form = null
    switch (topic.topic_type) {
      case 'diagnosis':
        form = AssembledDiagnosisForm(topic, allTopics, visit, rowID)
        break;
      case 'dissection':
        form = AssembledDissectionForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'family member':
        form = AssembledFamilyMemberForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'genetic test':
        form = AssembledGeneticTestForm(topic, visit, rowID)
        break;
      case 'heart_measurement':
        form = AssembledHeartMeasurementForm(topic, visit, rowID)
        break;
      case 'hospitalization':
        form = AssembledHospitalizationForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'measurement':
        form = AssembledMeasurementForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'medication':
        form = AssembledMedicationForm(topic, visit, rowID)
        break;
      case 'procedure':
        form = AssembledProcedureForm(topic, unsortedTopics, visit, rowID)
        break;
      case 'vital':
        form = AssembledVitalForm(topic, visit, rowID)
        break;
      default:
    }
    return form
  }
}
