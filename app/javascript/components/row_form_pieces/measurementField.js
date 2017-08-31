import selectConstructor from './selectConstructor'
export default {
  measurementField(topic, parameterizedPlural, multiSelect = '', title = 'units', rowID = topic.id) {
    const options = topic.units_of_measurement
    let returnStatement = `<div class='form-inline'>
      <input type='number' name='visit[${parameterizedPlural}_attributes][${rowID}][test_amount]' id='visit_${parameterizedPlural}_attributes_${rowID}_test_amount' class='form-control calculator' min="${topic.min_value}" max="${topic.max_value}" step="${topic.step}" value=''>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${rowID}_test_calc_button'>
        <i class='fa fa-calculator'></i>
      </button>
      ${selectConstructor(options, title, false, 'test_unit_of_meas', parameterizedPlural, rowID)}
    </div>
    `;
    return returnStatement
  }
}
