import $ from 'jquery';
import keyboard from 'virtual-keyboard';

$.fn.addKeyboard = function () {
  return this.keyboard({
    openOn: null,
    stayOpen: false,
    layout: 'custom',
    customLayout: {
      'normal': ['7 8 9 {c}', '4 5 6 {del}', '1 2 3 {sign}', '0 0 {dec} {a}'],
    },
    position: {
      // null (attach to input/textarea) or a jQuery object (attach elsewhere)
      of: null,
      my: 'center top',
      at: 'center top',
      // at2 is used when "usePreview" is false (centers keyboard at the bottom
      // of the input/textarea)
      at2: 'center top',
      collision: 'flipfit flipfit'
    },
    reposition: true,
    css: {
      input: 'form-control input-sm',
      container: 'center-block dropdown-menu',
      buttonDefault: 'btn btn-default',
      buttonHover: 'btn-light',
      // used when disabling the decimal button {dec}
      // when a decimal exists in the input area
      buttonDisabled: 'enabled',
    },
  });
};
