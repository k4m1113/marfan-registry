import timeAgoField from './timeAgoField';
import selectConstructor from './selectConstructor';
import noteField from './noteField';
import fileAttachmentButton from './fileAttachmentButton';

const classifications = [
  'pathogenic',
  'likely pathogenic',
  'VUS likely disease-causing',
  'VUS',
  'VUS likely benign',
  'likely benign',
  'benign',
  'consistent with clinical diagnosis'
];

const locations = [
  'Ambry',
  'Collagen Diagnostic Laboratory',
  'Connective Tissue Gene Tests',
  'GeneDX',
  'Invitae',
  'Laboratory for Molecular Medicine',
  'Matrix',
  'Tulane'
];

module.exports = function assembledGeneticTestForm(topic, rowID = topic.id) {
  const parameterizedPlural = 'genetic_tests'
  const returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    <div class="form-group row no-gutters">
      <div class="col-sm-3">
        Lab
        <select name="visit[genetic_tests_attributes][${rowID}][lab_name]" id="visit_genetic_tests_attributes_${rowID}_lab_name" class="form-control" required="true">
        ${selectConstructor(locations, 'lab name', true)}
        </select>
        <input type="text" class="form-control" name="visit[${parameterizedPlural}_attributes][${rowID}][lab_name]" id="visit_${parameterizedPlural}_attributes_${rowID}" style="display:none"/>
      </div>
      <div class="col-sm-3">
        Lab Classification
        <select name="visit[genetic_tests_attributes][${rowID}][lab_classification]" id="visit_genetic_tests_attributes_${rowID}_lab_classification" class="form-control" required="true">
          ${selectConstructor(classifications, 'lab classification')}
        </select>
      </div>
      <div class="col-sm-3">
        Clinical Classification
        <select name="visit[genetic_tests_attributes][${rowID}][clinical_classification]" id="visit_genetic_tests_attributes_${rowID}_clinical_classification" class="form-control">
          ${selectConstructor(classifications, 'clinical classification')}
        </select>
      </div>
      <div class="col-sm-3">
        <div class="form-check">
          <label class="form-check-label">
            <input type="checkbox" value="true" name="visit[genetic_tests_attributes][${rowID}][predictive_testing_recommended]" id="visit_genetic_tests_attributes_${rowID}_predictive_testing_recommended" class="form-check-input"/>
            Recommend predictive testing
          </label>
        </div>
      </div>
    </div>
    <div class="form-group row no-gutters">
      <div class="col-sm-4">
        Transcript
        <div class="input-group">
          <span class="input-group-addon" id="transcript_${rowID}">NM_</span>
          <input type='string' placeholder='000138.4' name='visit[${parameterizedPlural}_attributes][${rowID}][transcript]' id='visit_${parameterizedPlural}_attributes_${rowID}_transcript' class='form-control' value="" aria-describedby="transcript_${rowID}"/>
        </div>
      </div>
      <div class="col-sm-4">
        Protein
        <div class="input-group">
          <span class="input-group-addon" id="protein_${rowID}">p.</span>
          <input type='string' placeholder='Gly931fsX10' name='visit[${parameterizedPlural}_attributes][${rowID}][protein]' id='visit_${parameterizedPlural}_attributes_${rowID}_protein' class='form-control' value="" aria-describedby="protein_${rowID}"/>
        </div>
      </div>
      <div class="col-sm-3">
        Variant
        <div class="input-group">
          <span class="input-group-addon" id="variant_${rowID}">c.</span>
          <input type='string' placeholder='2793delG' name='visit[${parameterizedPlural}_attributes][${rowID}][variant]' id='visit_${parameterizedPlural}_attributes_${rowID}_variant' class='form-control' value="" aria-describedby="variant_${rowID}"/>
        </div>
      </div>
      <div class="col-sm-1">
        Exons
        <input type='number' placeholder='23' min="1" max="63" name='visit[${parameterizedPlural}_attributes][${rowID}][exons]' id='visit_${parameterizedPlural}_attributes_${rowID}_exons' class='form-control' value="" />
      </div>
    </div>

    <div class='row no-gutters'>
      <div class="form-inline col-sm-8">
        ${timeAgoField(topic, parameterizedPlural)}
        </div>
      <div class="form-inline col-sm-4">
        ${noteField(topic, parameterizedPlural)}
        ${fileAttachmentButton(topic, parameterizedPlural)}
      </div>
    </div>
  </td></tr>
  `
  return returnStatement
}
