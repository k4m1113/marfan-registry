import selectConstructor from './selectConstructor'
const options = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year']

module.exports = function renderFrequencyField(topic, parameterizedPlural) {
  const returnStatement = `
  <div class='input-group'>
    <input
      type='number'
      name='visit[${parameterizedPlural}_attributes][${topic.id}][frequency_amount]'
      id='visit_${parameterizedPlural}_attributes_${topic.id}_frequency_amount'
      class='form-control calculator'
      placeholder='frequency'
    >
    <span class='input-group-btn'>
      <button class='btn btn-secondary calculator' type='button' id='${parameterizedPlural}_${topic.id}_freq_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
      <select name='visit[${parameterizedPlural}_attributes][${topic.id}][frequency_scale]' id='visit_${parameterizedPlural}_attributes_${topic.id}_frequency_scale' class='form-control'>
        ${selectConstructor(options, 'times per')}
      </select>
  </div>
  `;
  return returnStatement
}
