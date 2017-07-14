module.exports = function noteField(topic, parameterizedPlural, rowID = rowID) {
  const returnStatement = `<textarea
    placeholder='note'
    name='visit[${parameterizedPlural}_attributes][${rowID}][note]'
    id='visit_${parameterizedPlural}_attributes_${rowID}_note'
    class='form-control'
    value=""
    rows="1"></textarea>
    <button class="btn btn-secondary" data-toggle="modal" data-target="#row_${rowID}_scribble_modal" type="button">
      <i class="fa fa-pencil"></i>
    </button>`;
  return returnStatement;
}
