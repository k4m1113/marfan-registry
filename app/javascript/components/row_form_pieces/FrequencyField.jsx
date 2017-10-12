import React from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import SelectConstructor from './SelectConstructor';
require('../addKeyboard');
require('jquery-ujs');
require('jquery-ui/ui/core.js');
require('jquery-ui/ui/position');

export default class FrequencyField extends React.Component {
  constructor() {
    super();
    this.keyboardize = this.keyboardize.bind(this)
  }

  componentDidMount() {
    this.$el = $(this.el);
    this.$el.addKeyboard();
  }

  componentWillUnmount() {
    this.$el.addKeyboard('destroy');
  }

  keyboardize(e) {
    e.preventDefault();
    this.$el = $(this.el);
    const kb = this.$el.getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if (kb.isOpen) {
      kb.close();
    } else {
      kb.reveal();
    }
  }
  render() {
    const options = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year'];
    return (
      <div className="form-inline">
        <input
          type="number"
          name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][frequency_amount]'}
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_frequency_amount'}
          className="form-control calculator"
          placeholder="frequency"
          ref={el => this.el = el}
        />
        <button
          className="btn btn-secondary calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_freq_calc_button'}
          onClick={this.keyboardize}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title="times per"
          name="frequencyScale"
          parameterizedPlural={this.props.parameterizedPlural}
          rowID={this.props.rowID}
        />
      </div>
    );
  }
}

FrequencyField.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
