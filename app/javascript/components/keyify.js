module.exports = function keyify(str) {
  [' ', '/'].forEach(function (x) {
    str = str.replace(x, '_')
  });
  ['(', ')'].forEach(function (y) {
    str = str.replace(y, '')
  });
  return str
}
