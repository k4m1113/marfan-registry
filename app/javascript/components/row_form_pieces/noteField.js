module.exports = function renderNoteField(topic, parameterizedPlural) {
  const returnStatement = `<textarea
    placeholder='note'
    name='visit[${parameterizedPlural}_attributes][${topic.id}][note]'
    id='visit_${parameterizedPlural}_attributes_${topic.id}_note'
    class='form-control'
    value=""
    rows="2"></textarea>
    <button class="btn btn-secondary" data-toggle="modal" data-target="#row_${topic.id}_scribble_modal" type="button">
      <i class="fa fa-pencil"></i>
    </button>`;
  return returnStatement;
}
