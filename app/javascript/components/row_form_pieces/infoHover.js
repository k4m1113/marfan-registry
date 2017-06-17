module.exports = function renderInfoHover(concerns) {
  console.log(concerns)
  const tooltipTitle = JSON.stringify(concerns).replace(/"/ig, "'")
  let returnStatement = `
  <button
    type="button"
    class="btn btn-secondary"
    data-toggle="tooltip"
    data-html="true"
    title="${tooltipTitle}">
    <i class="fa fa-question" aria-hidden="true"></i>
  </button>`
  return returnStatement
}
