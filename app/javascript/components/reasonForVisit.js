const reasonsForVisit = [
  'flu',
  'checkup',
  'initial visit',
  'family history',
  'aortic imaging',
  'chest pain'
]
module.exports = function renderReasonForVisitHeader(visit) {
  let returnStatement = ''
  if (!visit.primary_reason) {
    returnStatement += 'Reason for Visit: '
    const options = reasonsForVisit.map(r =>
      `<label class="btn btn-primary">
        <input type="radio" autocomplete="off" name="visit[primary_reason]" value="${r}">
        ${r}
      </label>`
    ).join('');
    returnStatement += options
    returnStatement += `<button type="submit" class="btn btn-success btn-sm confirm-submit" data-attr="reason_for_visit">
      <i class="fa fa-check" aria-hidden="true"></i>
    </button>`
  }
  return returnStatement
}
