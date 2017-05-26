module.exports = function renderNoteField(topic, parameterizedPlural) {
  const returnStatement = `<input type='textarea' placeholder='note' name='visit[${parameterizedPlural}_attributes][${topic}][note]' id='visit_${parameterizedPlural}_attributes_${topic}_note' class='form-control'>`;
  return returnStatement;
}
