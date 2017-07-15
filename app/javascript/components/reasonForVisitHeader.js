const reasonsForVisit = [
  'flu',
  'checkup',
  'initial visit',
  'family history',
  'aortic imaging',
  'chest pain'
]
module.exports = function reasonForVisitHeader(visit) {
  let returnStatement = ''
  if (!visit.primary_reason) {
    returnStatement += `<div class="alert alert-warning alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>`
      returnStatement += 'Reason for Visit: '
      const options = reasonsForVisit.map(r =>
        `<label class="btn btn-secondary">
          <input type="radio" autocomplete="off" name="visit[primary_reason]" value="${r}">
          ${r}
        </label>`
      ).join('');
      returnStatement += options
      returnStatement += '</div>'
  }
  return returnStatement
}
