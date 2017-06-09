module.exports = function renderScribbleButton(title, mskey, mshmac) {
  const returnStatement = `
    <div class="modal" tabindex="-1" role="dialog" aria-hidden="true" id="${title}_scribble_modal">
      <div class="modal-dialog modal-xl">
        <div class="modal-content scribble">
          <div class="form-inline">
            <div touch-action="none">
              <myscript-math-web
                applicationkey="${mskey}"
                hmackey="${mshmac}"
                protocol="REST"
                hideresult="true"
                hidebuttons="true"
                timeout="1000"
                class="scribble"
                id="${title}_scribble">
              </myscript-math-web>
            </div>
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
            </div>
          </div>
        </div>
      </div>
    </div>`;
  return returnStatement
}
