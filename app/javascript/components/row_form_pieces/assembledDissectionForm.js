import fileAttachmentButton from './fileAttachmentButton';
import findRelated from './findRelated';
import hiddenFields from './hiddenFields';
import noteField from './noteField';
import timeAgoField from './timeAgoField';
import selectConstructor from './selectConstructor';

module.exports = function assembledDissectionForm(topic, unsortedTopics, visit, rowID = topic.id) {
  const locations = ['aortic root', 'ascending aorta', 'arch', 'descending thoracic', 'suprarenal abdominal', 'infrarenal abdominal', 'iliac', 'renal', 'SMA', 'celiac', 'innominate', 'left carotid', 'left subclavian'];
  const perfused = ['perfused', 'ischemic'];
  const lumens = ['true lumen', 'false lumen', 'dissected'];
  const directions = ['right', 'left', 'N/A'];
  const parameterizedPlural = 'dissections';
  let returnStatement = ''
  returnStatement += `
    <tr class='row_form' id='row_${rowID}' style='display:none'><td colspan='3'>
    ${hiddenFields(visit, topic, parameterizedPlural)}
      <div class="form-inline">
        <select
          name="visit[dissections_attributes][${rowID}][location]"
          id="visit_dissections_attributes_${rowID}_location"
          class="form-control">
          ${selectConstructor(locations, 'location')}
        </select>
        <select
          name="visit[dissections_attributes][${rowID}][direction]"
          id="visit_dissections_attributes_${rowID}_direction"
          class="form-control">
          ${selectConstructor(directions, 'direction')}
        </select>
        <select
          name="visit[dissections_attributes][${rowID}][lumen]"
          id="visit_dissections_attributes_${rowID}_lumen"
          class="form-control">
          ${selectConstructor(lumens, 'lumen')}
        </select>
        <select
          name="visit[dissections_attributes][${rowID}][perfusion]"
          id="visit_dissections_attributes_${rowID}_perfusion"
          class="form-control">
          ${selectConstructor(perfused, 'perfusion')}
        </select>
      </div>
      <div class="form-inline">
        ${timeAgoField(topic, parameterizedPlural)}
        ${noteField(topic, parameterizedPlural)}
        ${fileAttachmentButton(topic, parameterizedPlural)}

        What type of intervention was performed?
      </div>
      ${findRelated(topic, unsortedTopics)}
    </td></tr>
  `
  return returnStatement
}
