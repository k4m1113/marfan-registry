module.exports = function renderScribbleButton(mskey, mshmac) {
  const returnStatement = `
    <myscript-math-web
      applicationkey="${mskey}"
      hmackey="${mshmac}"
      protocol="REST"
      hideresult="true">
     </myscript-math-web>
  `;
  return returnStatement
}
