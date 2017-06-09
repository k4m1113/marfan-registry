module.exports = function renderNoteField(topic, parameterizedPlural) {
  const returnStatement = `<textarea
    placeholder='note'
    name='visit[${parameterizedPlural}_attributes][${topic.id}][note]'
    id='visit_${parameterizedPlural}_attributes_${topic.id}_note'
    class='form-control'
    value=""
    rows="4"></textarea>`;
  return returnStatement;
}
