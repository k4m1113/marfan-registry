import selectConstructor from './selectConstructor'
`%i[visit_id patient_id topic_id vital test_amount sbp dbp test_unit_of_meas measurement note attachment],
`
module.exports = function renderMeasurementField(topic, parameterizedPlural) {
  const options = topic.units_of_measurement
  const returnStatement = `
  <div class='input-group'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic.id}][test_amount]' id='visit_${parameterizedPlural}_attributes_${topic.id}_test_amount' class='form-control calculator' placeholder='${topic.name}' value=''>
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${topic.id}_test_calc_button'>
        <i class='fa fa-calculator'></i>
      </button>
    </span>
      <select name='visit[${parameterizedPlural}_attributes][${topic.id}][test_unit_of_meas]' id='visit_${parameterizedPlural}_attributes_${topic.id}_test_unit_of_meas' class='form-control'>
        ${selectConstructor(options, 'units')}
      </select>
  </div>
  `;
  return returnStatement
}
