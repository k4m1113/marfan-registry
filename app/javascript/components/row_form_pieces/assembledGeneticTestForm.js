import timeAgoField from './timeAgoField';
import selectConstructor from './selectConstructor';
import noteField from './noteField';
import fileAttachmentButton from './fileAttachmentButton';

const testTypes = [
  'diagnostic',
  'newborn',
  'carrier',
  'prenatal',
  'preimplantation',
  'predictive',
  'forensic',
  'clinical diagnosis'
];
const pathogenicities = [
  'benign',
  'pathogenic',
  'VUS'
];
const locations = [
  'clinic',
  'Invitae',
  '23andMe'
];
module.exports = function assembledGeneticTestForm(topic) {
  const parameterizedPlural = 'genetic_tests'
  const returnStatement = `
  <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
    <div class='form-inline'>
      ${timeAgoField(topic, parameterizedPlural)}
    </div>
    <div class="form-inline">
      <select name="visit[genetic_tests_attributes][${topic.id}][test_type]" id="visit_genetic_tests_attributes_${topic.id}_test_type" class="form-control">
        ${selectConstructor(testTypes, 'type')}
      </select>
      <select name="visit[genetic_tests_attributes][${topic.id}][pathogenicity]" id="visit_genetic_tests_attributes_${topic.id}_pathogenicity" class="form-control">
        ${selectConstructor(pathogenicities, 'pathogenic?')}
      </select>
      <select name="visit[genetic_tests_attributes][${topic.id}][company]" id="visit_genetic_tests_attributes_${topic.id}_company" class="form-control">

        ${selectConstructor(locations, 'company')}
      </select>
    </div>

    <div class='form-inline'>
      ${noteField(topic, parameterizedPlural)}
      ${fileAttachmentButton(topic, parameterizedPlural)}
    </div>
  </td></tr>
  `
  return returnStatement
}
