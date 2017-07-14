import selectConstructor from './selectConstructor'
const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)']

module.exports = function durationField(topic, parameterizedPlural, rowID) {
  const returnStatement = `<div class='form-inline'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${rowID}][duration_amount]' id='visit_${parameterizedPlural}_attributes_${rowID}_duration_amount' class='form-control calculator' placeholder='duration'>
    <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${rowID}_duration_calc_button'><i class='fa fa-calculator'></i></button>
    ${selectConstructor(options, 'for how long', false, 'duration_scale', parameterizedPlural, rowID)}
  </div>`
  return returnStatement
}
