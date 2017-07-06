module.exports = function findRelated(topic) {
  let returnStatement = '<div class="btn-group" role="group" aria-label="RELATED">'
  if (topic.related) {
    let nextStep = topic.related.map(ind => unsortedTopics.find(obj => obj.id === ind))
    for (let i = 0; i < nextStep.length; i++) {
      let data = JSON.stringify(nextStep[i])
      returnStatement += `<button type="button" class="btn btn-sm btn-secondary related" data-topic='${data}'>
        ${nextStep[i].name} &nbsp
        <i class="fa fa-plus-circle" aria-hidden="true"></i>
      </button>`
    }
    returnStatement += '</div>'
  }
  return returnStatement;
}
