module.exports = function renderTimeAgoField(topic, parameterizedPlural) {
  const returnStatement = `<div class='input-group'>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic}][time_ago_amount]' id='visit_${parameterizedPlural}_attributes_${topic}_time_ago_amount' class='form-control' placeholder='time ago'>
    <span class='input-group-btn'>
      <button class='btn btn-primary' type='button' id='${parameterizedPlural}_${topic}_time_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    <select name='visit[${parameterizedPlural}_attributes][${topic}][time_ago_scale]' id='visit_${parameterizedPlural}_attributes_${topic}_time_ago_scale' class='form-control'>
      <%= render 'topics/row_form_components/plural_select_options' %>
    </select>
    <label for='visit_${parameterizedPlural}_attributes_${topic}_time_ago_scale'>
    ago
    </label>
  </div>
  <script>
  $('#visit_${parameterizedPlural}_attributes_${topic}_time_ago_amount').addKeyboard();
  $('#${parameterizedPlural}_${topic}_time_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb = $('#visit_${parameterizedPlural}_attributes_${topic}_time_ago_amount').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb.isOpen ) {
      kb.close();
    } else {
      kb.reveal();
    }
  });
  </script>`;
  return returnStatement;
}
