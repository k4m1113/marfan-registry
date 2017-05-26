module.exports = function renderKeywords(topic, descriptors, parameterizedPlural) {
  let returnStatement = ``
  if (descriptors[0].length) {
    returnStatement += `<div class='form-inline'>`
    for (var i = 0; i < descriptors.length; i++) {
      returnStatement += `
        <div class='form-check form-check-inline'>
          <label class='form-check-label'>
            <input class='form-check-input' type='checkbox' name='visit[${parameterizedPlural}_attributes][${topic}][descriptors][]' id='visit_${parameterizedPlural}_attributes_${topic}_descriptors_${descriptors[i]}' value='${descriptors[i]}'>
            ${descriptors[i]}
          </label>
        </div>
      `
    };
    returnStatement += '</div>'

  }
  return returnStatement;
}
