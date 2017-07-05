import rowForm from './row_form_pieces/rowForm';

module.exports = function nestedListPane(topicsByType, visit) {
  let returnStatement = ''
  for (var topicGroup in topicsByType) {
    returnStatement += `<h1>${topicGroup}</h1>`
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
    </table>`;
  }
  return returnStatement;
};
