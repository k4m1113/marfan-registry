// turn an array into html select options
module.exports = function selectConstructor(array) {
  var returnStatement = []
  array.map(function(item) {
    const optionized = `<option>${item}</option>`
    returnStatement.push(optionized);
  })
  return returnStatement.join('')
}
