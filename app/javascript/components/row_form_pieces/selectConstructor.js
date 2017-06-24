// turn an array into html select options
module.exports = function selectConstructor(array, title) {
  if (array.length == 1) {
    return `<option value="${array[0]}" selected>${array[0]}</option>`
  } else if (array.length == 2) {
    return `
      <option value="${array[0]}">
        ${array[0]}
      </option>
      <option value="${array[1]}">
        ${array[1]}
      </option>
    `
  } else if (array.length > 2) {
    let returnStatement = [`<option value="" selected disabled>${title}</option>`]
    array.map(function(item) {
      const optionized = `<option value="${item}">${item}</option>`
      returnStatement.push(optionized);
    })
    return returnStatement.join('')
  }
}
