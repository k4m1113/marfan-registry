import selectConstructor from './selectConstructor'
const options = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year']

export default {
  frequencyField(topic, parameterizedPlural, rowID) {
    const returnStatement = `
    <div class='form-inline'>
    <input
    type='number'
    name='visit[${parameterizedPlural}_attributes][${rowID}][frequency_amount]'
    id='visit_${parameterizedPlural}_attributes_${rowID}_frequency_amount'
    class='form-control calculator'
    placeholder='frequency'
    >
    <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${rowID}_freq_calc_button'><i class='fa fa-calculator'></i></button>
    ${selectConstructor(options, 'times per', false, 'frequency_scale', parameterizedPlural, rowID)}
    </div>
    `;
    return returnStatement
  }
}
