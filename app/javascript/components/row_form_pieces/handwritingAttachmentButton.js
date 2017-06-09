module.exports = function renderScribbleButton(title, mskey, mshmac) {
  const returnStatement = `
    <myscript-math-web
      applicationkey="${mskey}"
      hmackey="${mshmac}"
      protocol="REST"
      hideresult="true"
      hidebuttons="true"
      class="scribble"
      id="${title}_scribble">
    </myscript-math-web>
    <div class="btn-group-vertical">
      <button type="button" class="btn btn-primary accept">
        <i class="fa fa-check"></i>
      </button>
      <button type="button" class="btn btn-primary undo">
        <i class="fa fa-undo"></i>
      </button>
      <button type="button" class="btn btn-primary redo">
        <i class="fa fa-repeat"></i>
      </button>
      <button type="button" class="btn btn-primary destroy">
        <i class="fa fa-trash"></i>
      </button>
    </div>`;
  return returnStatement
}
