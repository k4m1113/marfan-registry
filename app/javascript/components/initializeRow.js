import bootstrapSwitch from 'bootstrap-switch/dist/js/bootstrap-switch';
import addKeyboard from './addKeyboard';
import scribbleButton from './row_form_pieces/scribbleButton';

module.exports = function($) {
  $.fn.initializeRow = function() {
    let $rowForm = ''
    if ('pres_abs'.includes($(this).attr('class'))) {
      $rowForm = $(this).parent().parent().parent().next('tr.row_form');
    } else if ('row_form'.includes($(this).attr('class'))) {
      $rowForm = $(this)
    } else {
      $rowForm = $('#quickAddHook').find('tr');
    }
    // add keyboard and scribble widgets on row display
    $rowForm.find("input[type='number']").addKeyboard();
    // add time ago approx/exact toggle
    $rowForm.find('.time_ago_toggle').bootstrapSwitch({
      onText: 'Approx',
      offText: 'Exact',
      labelText: 'when?',
      onColor: 'secondary'
    });
    // toggle approximate or exact time ago
    $('.time_ago_toggle').on('switchChange.bootstrapSwitch', function (event, state) {
      const $inputgroup = $(this).parent().parent().parent();
      if (state === true) {
        $inputgroup.find('.approximate').show();
        $inputgroup.find('.exact').hide();
      } else {
        $inputgroup.find('.approximate').hide();
        $inputgroup.find('.exact').show();
      }
    });

     // add scribble area
     $rowForm.find("textarea").parent().append(scribbleButton($rowForm[0].id, mskey, mshmac))
     if ($(this).val() == "true") {
       $rowForm.show()
     } else if ($(this).val() == "false") {
       $rowForm.hide()
     } else {
       $rowForm.show()
     }
     $('.btn-group-vertical > button').click(function(e){
       var classes = $(this)[0].classList.value
       $current_row = $(this).closest('tr')
       $current_scribble = $current_row.find('myscript-math-web')[0]
       $note_field = $current_row.find("textarea")[0]
       $current_modal = $('.modal.show')

       if (classes.includes('accept')) {
         if ($current_scribble.result) {
           var result = $current_scribble.result['LATEX']
           $note_field.value += result
           $current_modal.modal('hide')
         }
       } else if (classes.includes('undo')) {
         $current_scribble.undo()
       } else if (classes.includes('redo')) {
         $current_scribble.redo()
       } else if (classes.includes('destroy')) {
         $current_scribble.clear()
       } else {
         console.log('error')
       }
     });
  }
}(jQuery);
