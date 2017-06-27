import selectConstructor from './selectConstructor';
import fileAttachmentButton from './fileAttachmentButton';
import timeAgoField from './timeAgoField';
import noteField from './noteField';
import findRelated from './findRelated';

module.exports = function assembledDissectionForm(topic, visit) {
  const locations = ['aortic root', 'ascending aorta', 'arch', 'descending thoracic', 'suprarenal abdominal', 'infrarenal abdominal', 'iliac', 'renal', 'SMA', 'celiac', 'innominate', 'left carotid', 'left subclavian'];
  const perfused = ['perfused', 'ischemic'];
  const lumens = ['true lumen', 'false lumen', 'dissected'];
  const directions = ['right', 'left', 'N/A'];
  const parameterizedPlural = 'dissections';
  let returnStatement
  returnStatement += `
    <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
      <div class="form-inline">
        <select
          name="visit[dissections_attributes][${topic.id}][location]"
          id="visit_dissections_attributes_${topic.id}_location"
          class="form-control">
          ${selectConstructor(locations, 'location')}
        </select>
        <select
          name="visit[dissections_attributes][${topic.id}][direction]"
          id="visit_dissections_attributes_${topic.id}_direction"
          class="form-control">
          ${selectConstructor(directions, 'direction')}
        </select>
        <select
          name="visit[dissections_attributes][${topic.id}][lumen]"
          id="visit_dissections_attributes_${topic.id}_lumen"
          class="form-control">
          ${selectConstructor(lumens, 'lumen')}
        </select>
        <select
          name="visit[dissections_attributes][${topic.id}][perfusion]"
          id="visit_dissections_attributes_${topic.id}_perfusion"
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
    </td></tr>
  `
  return returnStatement
}
