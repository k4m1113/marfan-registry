// turn an array into html select options
module.exports = function selectConstructor(array, title, other = false, attribute, parameterizedPlural, rowID, multiSelect = '') {
  let returnStatement = '';
  if (array.length === 1) {
    returnStatement += `<input
      type="text"
      disabled="true"
      name="visit[${parameterizedPlural}_attributes][${rowID}][${attribute}]"
      id="visit_${parameterizedPlural}_attributes_${rowID}_${attribute}"
      class="form-control single-option"
      value="${array[0]}"
      ${multiSelect}
    >`;
  } else {
    returnStatement += `<select
      name='visit[${parameterizedPlural}_attributes][${rowID}][${attribute}]'
      id='visit_${parameterizedPlural}_attributes_${rowID}_${attribute}'
      class='form-control'
      ${multiSelect}>`
    let options = []
    if (array.length >= 2) {
      options.push(`<option value="" selected disabled>${title}</option>`)
    }
    array.map(function(item) {
      const optionized = `<option value="${item}">${item}</option>`
      options.push(optionized);
    })
    if (other) {
      options.push('<option class="select-other">other (please specify)</option>')
    }
    returnStatement += options.join('');
    returnStatement += '</select>'
  }
  return returnStatement
}
