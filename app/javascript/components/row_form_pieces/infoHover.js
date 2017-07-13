module.exports = function infoHover(concerns) {
  const tooltipTitle = concerns.map(x => x.summary)
  let returnStatement = `
  <button
    type="button"
    class="btn btn-secondary tooltip-trigger"
    data-toggle="tooltip"
    data-html="true"
    title="${tooltipTitle}">
    <i class="fa fa-history" aria-hidden="true"></i>
  </button>`
  return returnStatement
}
