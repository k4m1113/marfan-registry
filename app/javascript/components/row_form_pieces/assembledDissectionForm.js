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
    ${hiddenFields(visit, topic, parameterizedPlural, rowID)}
      <div class="form-inline">
        ${selectConstructor(locations, 'location', false, 'location', parameterizedPlural, rowID)}
        ${selectConstructor(directions, 'direction', false, 'direction', parameterizedPlural, rowID)}
        ${selectConstructor(lumens, 'lumen', false, 'lumen', parameterizedPlural, rowID)}
        ${selectConstructor(perfused, 'perfusion', false, 'perfusion', parameterizedPlural, rowID)}
        </select>
      </div>
      <div class="form-inline">
        ${timeAgoField(topic, parameterizedPlural, rowID)}
        ${noteField(topic, parameterizedPlural, rowID)}
        ${fileAttachmentButton(topic, parameterizedPlural, rowID)}

        What type of intervention was performed?
      </div>
      ${findRelated(topic, unsortedTopics)}
    </td></tr>
  `
  return returnStatement
}
