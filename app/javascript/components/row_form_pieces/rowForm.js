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
function renderRowForm(topic) {
  const pp = parameterizedPlurals[topic.topic_type]
  const jq =  `<script>
    // hide or display row form based on 'present' or 'absent' checked
    $('input[name="visit[${pp}_attributes][${topic.id}][present]"]').change(function() {
      $('tr.row_form#row_${topic.id}').toggle($('input#visit_${pp}_attributes_${topic.id}_present_true')[0].checked)
      if ($('input#visit_${pp}_attributes_${topic.id}_present_true')[0].checked) {
        $('tr.row_form#row_${topic.id}').show()
      }
      else if ($('input#visit_${pp}_attributes_${topic.id}_present_false')[0].checked) {
        $('tr.row_form#row_${topic.id}').hide()
      }
      else {
        $('tr.row_form#row_${topic.id}').hide()
      }
    })

    // change handler for attachment upload camera button
    $('input#visit_${pp}_attributes_${topic.id}_attachment').on('change', function() {
      file_name = $(this).val().split('\\').pop().split('/').pop()
      console.log($(this));
      console.log(file_name);
      $(this).parent('td').find('label').append(file_name)
    })
  </script>`;

  let returnStatement = `<%= f.fields_for :${pp}, @nested_scope.${pp}.build do |ff| %>`

  switch (topic['topic_type']) {
    case "family member":
      returnStatement += `${renderFamilyMemberForm(topic)}`;
      break;
    case "diagnosis":
      returnStatement += `${renderButtons(topic)}`;
      returnStatement += `${renderDiagnosisForm(topic)}`;
      break;
    case "hospitalization":
      returnStatement += `${renderButtons(topic)}`;
      returnStatement += `${renderHospitalizationForm(topic)}`;
      break;
    case "procedure":
      returnStatement += `${renderButtons(topic)}`;
      returnStatement += `${renderProcedureForm(topic)}`;
      break;
    case "vital":
      "kat"
      break;
    case "medication":
      returnStatement += `${renderMedicationForm(topic)}`;
      break;
    default:
      console.log('default');
  };

  returnStatement += `<% end %>`
  returnStatement += jq
  return returnStatement;
}
