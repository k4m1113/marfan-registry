export default function keyify(str) {
  let strang
  [' ', '/'].forEach(function (x) {
    strang = str.replace(x, '_')
  });
  ['(', ')'].forEach(function (y) {
    strang = str.replace(y, '')
  });
  return strang
}
