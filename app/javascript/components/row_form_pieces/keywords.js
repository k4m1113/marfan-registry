module.exports = function renderKeywords(topic, parameterizedPlural) {
  let returnStatement = ``
  if (topic.descriptors) {
    returnStatement += `<div class='form-inline'>`
    for (var i = 0; i < topic.descriptors.length; i++) {
      returnStatement += `
        <div class='form-check form-check-inline'>
          <label class='form-check-label'>
            <input class='form-check-input' type='checkbox' name='visit[${parameterizedPlural}_attributes][${topic.id}][descriptors][]' id='visit_${parameterizedPlural}_attributes_${topic.id}_descriptors_${topic.descriptors[i]}' value='${topic.descriptors[i]}'>
            ${topic.descriptors[i]}
          </label>
        </div>
      `
    };
    returnStatement += '</div>'

  }
  return returnStatement;
}
