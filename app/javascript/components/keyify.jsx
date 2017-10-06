function keyify(str) {
  let strang = str;
  [' ', '/'].forEach(x =>
    strang = strang.replace(x, '_')
  );
  ['(', ')'].forEach(y =>
    strang = strang.replace(y, '')
  );
  return strang;
}
export default keyify;
