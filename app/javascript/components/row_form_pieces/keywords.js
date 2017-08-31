export default {
  keywords(topic, parameterizedPlural, rowID = rowID) {
    let returnStatement = ``
    if (topic.descriptors) {
      returnStatement += `<div class='form-inline descriptors'>`
      for (var i = 0; i < topic.descriptors.length; i++) {
        returnStatement += `
            <label class='form-check-label descriptor'>
              <input class='form-check-input' type='checkbox' name='visit[${parameterizedPlural}_attributes][${rowID}][descriptors][]' id='visit_${parameterizedPlural}_attributes_${rowID}_descriptors_${topic.descriptors[i]}' value='${topic.descriptors[i]}'>
              ${topic.descriptors[i]}
            </label>
        `
      }
      returnStatement += '</div>'
    }
    return returnStatement;
  }
}
