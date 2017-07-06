import rowForm from './row_form_pieces/rowForm';
import keyify from './keyify';

module.exports = function nestedListPane(topicsByType, visit, paneKey) {
  let returnStatement = '<div class="row topicButtons">'
  for (var tg in topicsByType) {
    const topicTypeKey = keyify(tg)
    returnStatement += `<button class="paneTopicGroup btn btn-secondary" data-target="${paneKey}_${topicTypeKey}" type="button">
      ${tg}
    </button>`
  }
  returnStatement += '</div>'
  for (var topicGroup in topicsByType) {
    const typeKey = keyify(topicGroup)
    returnStatement += `<div id="${paneKey}_${typeKey}" class="tabbable">`
    returnStatement += `<table class="table table-sm">
    <thead>
      <tr>
        <th>
          <h6 class="btn btn-sm all-neg-toggler">All Absent</button>
        </th>
        <th>
          Present
        </th>
        <th>
          Absent
        </th>
      </tr>
    </thead>
    <tbody>`
    for (var i = 0; i < topicsByType[topicGroup].length; i++) {
      returnStatement += `${rowForm(topicsByType[topicGroup][i], visit)}`
    }
    returnStatement += `</tbody>
    </table>
    </div>`;
  }
  return returnStatement;
};
