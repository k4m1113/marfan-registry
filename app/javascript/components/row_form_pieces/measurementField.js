import selectConstructor from './selectConstructor'
module.exports = function renderMeasurementField(topic, parameterizedPlural, multiSelect = '', title = 'units') {
  const options = topic.units_of_measurement
  const returnStatement = `
  <div class='input-group'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic.id}][test_amount]' id='visit_${parameterizedPlural}_attributes_${topic.id}_test_amount' class='form-control calculator' placeholder='${topic.name}' value=''>
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${topic.id}_test_calc_button'>
        <i class='fa fa-calculator'></i>
      </button>
    </span>
      <select
        name='visit[${parameterizedPlural}_attributes][${topic.id}][test_unit_of_meas]'
        id='visit_${parameterizedPlural}_attributes_${topic.id}_test_unit_of_meas'
        class='form-control'${multiSelect}>
        ${selectConstructor(options, title)}
      </select>
  </div>
  `;
  return returnStatement
}
