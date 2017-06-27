import selectConstructor from './selectConstructor'
import frequencyField from './frequencyField'
import timeAgoField from './timeAgoField'
import durationField from './durationField'
import noteField from './noteField'
import addKeyboard from '../addKeyboard'

const ingestionMethods = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally']
const unitsOfMeas = ['mcg', 'mg', 'mL', 'mm', 'g', 'L', 'IU']
const dosageForms = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository']

module.exports = function medFormFields(topic){
  const returnStatement = `
  <div class='form-inline'>
    DOSE
    <input type='number' name='visit[medications_attributes][${topic.id}][dose]' id='visit_medications_attributes_${topic.id}_dose' class='form-control calculator' placeholder='dose'>
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='medications_${topic.id}_dose_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[medications_attributes][${topic.id}][dose_unit_of_measurement]' id='visit_medications_attributes_${topic.id}_dose_unit_of_measurement' class='form-control'>
      ${selectConstructor(unitsOfMeas, 'dose units')}
    </select>
  </div>

  <div class='form-inline'>
    DOSAGE FORM
    <input type='number' name='visit[medications_attributes][${topic.id}][dosage_form_units]' id='visit_medications_attributes_${topic.id}_dosage_form_units' class='form-control calculator' placeholder='dosage form units'>
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='medications_${topic.id}_dose_units_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[medications_attributes][${topic.id}][dosage_form_units]' id='visit_medications_attributes_${topic.id}_dosage_form_units' class='form-control'>
      ${selectConstructor(unitsOfMeas, 'dose form units')}
    </select>
    <select name='visit[medications_attributes][${topic.id}][dosage_form]' id='visit_medications_attributes_${topic.id}_dosage_form' class='form-control'>
      ${selectConstructor(dosageForms, 'dose form')}
    </select>
  </div>

  <div class='form-inline'>
    METHOD OF INGESTION
    <select name='visit[medications_attributes][${topic.id}][ingestion_method]' id='visit_medications_attributes_${topic.id}_ingestion_method' class='form-control'>
      ${selectConstructor(ingestionMethods, 'MOI')}
    </select>
  </div>

  <div class='form-inline'>
    DURATION
    ${durationField(topic, 'medications')}
  </div>

  <div class='form-inline'>
    FREQUENCY
    ${frequencyField(topic, 'medications')}
  </div>

  <div class='form-inline'>
    TIME AGO
    ${timeAgoField(topic, 'medications')}
  </div>

  <div class='form-inline'>
    NOTE
    ${noteField(topic, 'medications')}
  </div>`
  return returnStatement
}
