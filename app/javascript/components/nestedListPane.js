import renderRowForm from './row_form_pieces/rowForm';

module.exports = function nestedListPane(arr, visit) {
  let returnStatement = `<table class="table table-sm">
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
    for (var i = 0; i < arr.length; i++) {
      returnStatement += `${renderRowForm(arr[i], visit)}`
    }
    returnStatement += `</tbody>
  </table>`;
  return returnStatement;
};
