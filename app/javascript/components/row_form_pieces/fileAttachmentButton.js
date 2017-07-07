module.exports = function fileAttachmentButton(topic, parameterizedPlural) {
  const returnStatement = `
    <input  name="visit[${parameterizedPlural}_attributes][${topic.id}][attachment]" id="visit_${parameterizedPlural}_attributes_${topic.id}_attachment" style="display:none" type="file">
      <button class="btn btn-secondary file-attachment" type="button">
      <label for="visit_${parameterizedPlural}_attributes_${topic.id}_attachment" class="fontawesome-icon">
      <i class="fa fa-camera"></i>
    </label>
  </button>
  `;
  return returnStatement
}
