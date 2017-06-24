import selectConstructor from './selectConstructor';
import fileAttachmentButton from './fileAttachmentButton';
import renderTimeAgoField from './timeAgoField';
import noteField from './noteField';
import findRelated from './findRelated';

module.exports = function renderDissectionForm(topic, visit) {
  const locations = ['aortic root', 'ascending aorta', 'arch', 'descending thoracic', 'suprarenal abdominal', 'infrarenal abdominal', 'iliac', 'renal', 'SMA', 'celiac', 'innominate', 'left carotid', 'left subclavian'];
  const perfused = ['perfused', 'ischemic'];
  const lumens = ['true lumen', 'false lumen', 'dissected'];
  const directions = ['right', 'left', 'N/A'];
  const parameterizedPlural = 'dissections';
  let returnStatement
  returnStatement += `
    <tr class='row_form' id='row_${topic.id}' style='display:none'><td colspan='3'>
      <div class="form-inline">
        <select>
        ${selectConstructor(locations, 'location')}
        </select>
        <select>
        ${selectConstructor(directions, 'direction')}
        </select>
        <select>
          ${selectConstructor(lumens, 'lumen')}
        </select>
        <select>
          ${selectConstructor(perfused, 'perfusion')}
        </select>
      </div>
      <div class="form-inline">
        ${renderTimeAgoField(topic, parameterizedPlural)}
        ${noteField(topic, parameterizedPlural)}
        ${fileAttachmentButton(topic, parameterizedPlural)}

        What type of intervention was performed?
      </div>
    </td></tr>
  `
  return returnStatement
}
