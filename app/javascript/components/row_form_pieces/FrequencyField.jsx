import React, { Component } from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import SelectConstructor from './SelectConstructor';
require('../addKeyboard');
require('jquery-ujs');
require('jquery-ui/ui/core.js');
require('jquery-ui/ui/position');

export default class FrequencyField extends Component {
  constructor(props) {
    super(props);
    this.state = {
      frequencyAmount: this.props.frequencyAmount,
      frequencyUnit: this.props.frequencyUnit,
    }
    this.keyboardize = this.keyboardize.bind(this)
    this.handleChange = this.handleChange.bind(this)
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

  handleChange(event) {
    this.props.onFrequencyChange({
      [event.target.name]: event.target.value
    });
  }

  render() {
    const options = ['second', 'minute', 'hour', 'day', 'week', 'month', 'year'];
    return (
      <div className="form-inline">
        <input
          type="number"
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_frequency_amount'}
          className="form-control calculator"
          placeholder="frequency"
          ref={el => this.el = el}
          name="frequencyAmount"
          value={this.state.frequencyAmount}
          onChange={this.handleChange}
        />
        <button
          className="btn btn-light calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_freq_calc_button'}
          onClick={this.keyboardize}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title="times per"
          rowID={this.props.rowID}
          parameterizedPlural={this.props.parameterizedPlural}
          name="frequencyUnit"
          value={this.state.frequencyUnit}
          onUnitChange={this.handleChange}
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
