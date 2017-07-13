import selectConstructor from './selectConstructor'
module.exports = function measurementField(topic, parameterizedPlural, multiSelect = '', title = 'units') {
  const options = topic.units_of_measurement
  let returnStatement = `<div class='form-inline'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic.id}][test_amount]' id='visit_${parameterizedPlural}_attributes_${topic.id}_test_amount' class='form-control calculator' placeholder='${topic.name}' min="${topic.min_value}" max="${topic.max_value}" step="${topic.step}" value=''>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${topic.id}_test_calc_button'>
        <i class='fa fa-calculator'></i>
      </button>
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
