import fileAttachmentButton from './fileAttachmentButton';
import hiddenFields from './hiddenFields'
import noteField from './noteField';
import selectConstructor from './selectConstructor';
import timeAgoField from './timeAgoField';

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

module.exports = function assembledGeneticTestForm(topic, visit, rowID = topic.id) {
  const parameterizedPlural = 'genetic_tests'
  let returnStatement = `
  <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
  ${hiddenFields(visit, topic, parameterizedPlural, rowID)}
    <div class="form-group row no-gutters">
      <div class="col-sm-3">
        Lab
        ${selectConstructor(locations, 'lab name', true, 'lab_name', parameterizedPlural, rowID)}`
        // <input type="text" class="form-control" name="visit[${parameterizedPlural}_attributes][${rowID}][lab_name]" id="visit_${parameterizedPlural}_attributes_${rowID}" style="display:none"/>
      returnStatement += `</div>
      <div class="col-sm-3">
        Lab Classification
        ${selectConstructor(classifications, 'lab classification', false, 'lab_classification', parameterizedPlural, rowID)}
      </div>
      <div class="col-sm-3">
        Clinical Classification
        ${selectConstructor(classifications, 'clinical classification', false, 'clinical_classification', parameterizedPlural, rowID)}
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
        ${timeAgoField(topic, parameterizedPlural, rowID)}
        </div>
      <div class="form-inline col-sm-4">
        ${noteField(topic, parameterizedPlural, rowID)}
        ${fileAttachmentButton(topic, parameterizedPlural, rowID)}
      </div>
    </div>
  </td></tr>
  `
  return returnStatement
}
