import selectConstructor from './selectConstructor'
const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)']

module.exports = function renderDurationField(topic, parameterizedPlural) {
  const returnStatement = `<div class='form-inline'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic.id}][duration_amount]' id='visit_${parameterizedPlural}_attributes_${topic.id}_duration_amount' class='form-control calculator' placeholder='duration'>
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${topic.id}_duration_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[${parameterizedPlural}_attributes][${topic.id}][duration_scale]' id='visit_${parameterizedPlural}_attributes_${topic.id}_duration_scale' class='form-control'>
      ${selectConstructor(options, 'for how long')}
    </select>
  </div>`
  return returnStatement
}
