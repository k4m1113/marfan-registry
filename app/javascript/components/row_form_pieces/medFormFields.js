import selectConstructor from './selectConstructor'
import renderFrequencyField from './frequencyField'
import renderTimeAgoField from './timeAgoField'
import renderDurationField from './durationField'
import renderNoteField from './noteField'
import addKeyboard from '../addKeyboard'

const ingestionMethods = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally']
const unitsOfMeas = ['mcg', 'mg', 'mL', 'mm', 'g', 'L', 'IU']
const dosageForms = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository']

module.exports = function renderMedFormBody(topic){
  const returnStatement = `
  <div class='input-group'>
    DOSE
    <input type='number' name='visit[medications_attributes][${topic.id}][dose]' id='visit_medications_attributes_${topic.id}_dose' class='form-control' placeholder='dose'>
    <span class='input-group-btn'>
      <button class='btn btn-primary' type='button' id='medications_${topic.id}_dose_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[medications_attributes][${topic.id}][dose_unit_of_measurement]' id='visit_medications_attributes_${topic.id}_dose_unit_of_measurement' class='form-control'>
      ${selectConstructor(unitsOfMeas)}
    </select>
  </div>

  <div class='input-group'>
    DOSAGE FORM
    <input type='number' name='visit[medications_attributes][${topic.id}][dosage_form_units]' id='visit_medications_attributes_${topic.id}_dosage_form_units' class='form-control' placeholder='dosage form units'>
    <span class='input-group-btn'>
      <button class='btn btn-primary' type='button' id='medications_${topic.id}_dose_units_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[medications_attributes][${topic.id}][dosage_form_units]' id='visit_medications_attributes_${topic.id}_dosage_form_units' class='form-control'>
      ${selectConstructor(unitsOfMeas)}
    </select>
    <select name='visit[medications_attributes][${topic.id}][dosage_form]' id='visit_medications_attributes_${topic.id}_dosage_form' class='form-control'>
      ${selectConstructor(dosageForms)}
    </select>
  </div>

  <div class='input-group'>
    METHOD OF INGESTION
    <select name='visit[medications_attributes][${topic.id}][ingestion_method]' id='visit_medications_attributes_${topic.id}_ingestion_method' class='form-control'>
      ${selectConstructor(ingestionMethods)}
    </select>
  </div>

  <div class='input-group'>
    DURATION
    ${renderDurationField(topic, 'medications')}
  </div>

  <div class='input-group'>
    FREQUENCY
    ${renderFrequencyField(topic, 'medications')}
  </div>

  <div class='input-group'>
    TIME AGO
    ${renderTimeAgoField(topic, 'medications')}
  </div>

  <div class='input-group'>
    TIME AGO
    ${renderNoteField(topic, 'medications')}
  </div>

  <script>
  $('#visit_medications_attributes_${topic.id}_dose').addKeyboard();
  $('#medications_${topic.id}_dose_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb = $('#visit_medications_attributes_${topic.id}_dose').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb.isOpen ) {
      kb.close();
    } else {
      kb.reveal();
    }
  });

  $('#visit_medications_attributes_${topic.id}_dosage_form_units').addKeyboard();
  $('#medications_${topic.id}_dose_units_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb2 = $('#visit_medications_attributes_${topic.id}_dosage_form_units').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb2.isOpen ) {
      kb2.close();
    } else {
      kb2.reveal();
    }
  });
  </script>
  `
  return returnStatement
}
