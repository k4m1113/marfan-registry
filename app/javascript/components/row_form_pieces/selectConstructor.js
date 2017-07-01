// turn an array into html select options
module.exports = function selectConstructor(array, title, other = false) {
  let options = []
  if (array.length > 2) {
    options.push(`<option value="" selected disabled>${title}</option>`)
  }
  array.map(function(item) {
    const optionized = `<option value="${item}">${item}</option>`
    options.push(optionized);
  })
  if (other) {
    options.push('<option class="select-other">other (please specify)</option>')
  }
  return options.join('');
}
