export default {
  findRelated(topic, unsortedTopics) {
    let returnStatement = '<div aria-label="RELATED">'
    if (topic.related.length) {
      returnStatement += `<hr/><div class="form-group row">
        <label class="col-2 col-form-label">
          Related:
        </label>
      <div class="col-10">`
      let nextStep = topic.related.map(ind => unsortedTopics.find(obj => obj.id === ind))
      for (let i = 0; i < nextStep.length; i++) {
        if (nextStep[i]) {
          let data = JSON.stringify(nextStep[i])
          returnStatement += `<button type="button" class="btn btn-secondary related" data-topic='${data}'>
          ${nextStep[i].name} &nbsp
          <i class="fa fa-plus" aria-hidden="true"></i>
          </button>`
        }
      }
      returnStatement += '</div></div>'
    }
    return returnStatement;
  }
}
