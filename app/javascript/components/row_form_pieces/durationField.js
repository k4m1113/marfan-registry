import selectConstructor from './selectConstructor'
const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)']

module.exports = function renderDurationField(topic, parameterizedPlural) {
  const returnStatement = `<div class='input-group'
    <label for='visit_${parameterizedPlural} _attributes_${topic.id}_duration_amount'>
    for
    </label>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic.id}][duration_amount]' id='visit_${parameterizedPlural}_attributes_${topic.id}_duration_amount' class='form-control' placeholder='duration'>
    <span class='input-group-btn'>
      <button class='btn btn-primary' type='button' id='${parameterizedPlural}_${topic.id}_duration_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[${parameterizedPlural}_attributes][${topic.id}][duration_scale]' id='visit_${parameterizedPlural}_attributes_${topic.id}_duration_scale' class='form-control'>
      ${selectConstructor(options)}
    </select>
  </div>
  <script>
  $('#visit_${parameterizedPlural}_attributes_${topic.id}_duration_amount').addKeyboard();
  $('#${parameterizedPlural}_${topic.id}_duration_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb = $('#visit_${parameterizedPlural}_attributes_${topic.id}_duration_amount').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb.isOpen ) {
      kb.close();
    } else {
      kb.reveal();
    }
  });
  </script>`
  return returnStatement
}
