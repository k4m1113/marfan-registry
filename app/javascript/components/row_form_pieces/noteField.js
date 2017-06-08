module.exports = function renderNoteField(topic, parameterizedPlural) {
  const returnStatement = `<input type='textarea' placeholder='note' name='visit[${parameterizedPlural}_attributes][${topic.id}][note]' id='visit_${parameterizedPlural}_attributes_${topic.id}_note' class='form-control'>
  <span class='input-group-btn'>
    <button class='btn btn-primary scribble' type='button' id='${parameterizedPlural}_${topic.id}_handwriting_button'>
      <i class='fa fa-pencil'></i>
    </button>
  </span>
  `;
  return returnStatement;
}
