module.exports = function fileAttachmentButton(topic, parameterizedPlural, rowID = topic.id) {
  const returnStatement = `
    <input  name="visit[${parameterizedPlural}_attributes][${rowID}][attachment]" id="visit_${parameterizedPlural}_attributes_${rowID}_attachment" style="display:none" type="file">
      <button class="btn btn-secondary file-attachment" type="button">
      <label for="visit_${parameterizedPlural}_attributes_${rowID}_attachment" class="fontawesome-icon">
      <i class="fa fa-camera"></i>
    </label>
  </button>
  `;
  return returnStatement
}
