module.exports = function renderFrequencyField(topic, parameterizedPlural) {
  const returnStatement = `
  <div class='input-group'
    <label for='visit_${parameterizedPlural}_attributes_${topic}_frequency_amount'>
    </label>
    <input type='number' name='visit[${parameterizedPlural}_attributes][${topic}][frequency_amount]' id='visit_${parameterizedPlural}_attributes_${topic}_frequency_amount' class='form-control' placeholder='frequency'>
    <span class='input-group-btn'>
      <button class='btn btn-primary' type='button' id='${parameterizedPlural}_${topic}_freq_calc_button'><i class='fa fa-calculator'></i></button>
    </span>
    times per
    <select name='visit[${parameterizedPlural}_attributes][${topic}][frequency_scale]' id='visit_${parameterizedPlural}_attributes_${topic}_frequency_scale' class='form-control'>
      <%= render 'topics/row_form_components/singular_select_options' %>
    </select>
  </div>
  <script>
  $('#visit_${parameterizedPlural}_attributes_${topic}_frequency_amount').addKeyboard();
  $('#${parameterizedPlural}_${topic}_freq_calc_button').click(function(e){
    e.stopImmediatePropagation();
    var kb = $('#visit_${parameterizedPlural}_attributes_${topic}_frequency_amount').getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if ( kb.isOpen ) {
      kb.close();
    } else {
      kb.reveal();
    }
  });
  </script>
  `;
  return returnStatement
}
