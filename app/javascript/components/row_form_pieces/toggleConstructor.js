// turn an array of 2 units of measurement into html radio buttons to hook bootstrapSwitch on
module.exports = function toggleConstructor(pair, conversion) {
  var returnStatement = [`<option value="" selected disabled>${title}</option>`]
  array.map(function(item) {
    const optionized = `<option>${item}</option>`
    returnStatement.push(optionized);
  })
  return returnStatement.join('')
}
