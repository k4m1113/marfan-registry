import selectConstructor from './selectConstructor'
import frequencyField from './frequencyField'
import timeAgoField from './timeAgoField'
import durationField from './durationField'
import noteField from './noteField'
import addKeyboard from '../addKeyboard'

const ingestionMethods = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally']
const unitsOfMeas = ['mcg', 'mg', 'mL', 'mm', 'g', 'L', 'IU']
const dosageForms = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository']

export default {
  medFormFields(topic, rowID = topic.id){
    const parameterizedPlural = 'medications'
    const returnStatement = `
    <div class="form-group row">
      <label class="col-2 col-form-label">Dose</label>
      <div class="form-inline col-10">
        <input type='number' name='visit[medications_attributes][${rowID}][dose]' id='visit_medications_attributes_${rowID}_dose' class='form-control calculator' placeholder='dose'>
        <span class='input-group-btn'>
          <button class='btn btn-secondary calculator' type='button' id='medications_${rowID}_dose_calc_button'><i class='fa fa-calculator'></i></button>
        </span>
        ${selectConstructor(unitsOfMeas, 'dose units', false, 'dose_unit_of_measurement', parameterizedPlural, rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">Dosage Form</label>
      <div class="form-inline col-10">
        <input type='number' name='visit[medications_attributes][${rowID}][dosage_form_units]' id='visit_medications_attributes_${rowID}_dosage_form_units' class='form-control calculator' placeholder='dosage form units'>
        <button class='btn btn-secondary calculator' type='button' id='medications_${rowID}_dose_units_calc_button'><i class='fa fa-calculator'></i></button>
        ${selectConstructor(unitsOfMeas, 'dose form units', false, 'dosage_form_units', parameterizedPlural, rowID)}
        ${selectConstructor(dosageForms, 'dose form', false, 'dosage_form', parameterizedPlural, rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">Method of Ingestion</label>
      <div class="form-inline col-10">
        ${selectConstructor(ingestionMethods, 'MOI', false, 'ingestion_method', parameterizedPlural, rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">Duration</label>
      <div class="form-inline col-10">
        ${durationField(topic, 'medications', rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">Frequency</label>
      <div class="form-inline col-10">
        ${frequencyField(topic, 'medications', rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">When</label>
      <div class="form-inline col-10">
        ${timeAgoField(topic, 'medications', rowID)}
      </div>
    </div>

    <div class="form-group row">
      <label class="col-2 col-form-label">Note</label>
      <div class="form-inline col-10">
        ${noteField(topic, 'medications', rowID)}
      </div>
    </div>`
    return returnStatement
  }
}
