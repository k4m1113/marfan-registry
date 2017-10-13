import React from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import SelectConstructor from './SelectConstructor';
require('../addKeyboard');
require('jquery-ujs');
require('jquery-ui/ui/core.js');
require('jquery-ui/ui/position');

export default class DurationField extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      durationAmount: this.props.durationAmount,
      durationUnit: this.props.durationUnit,
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
    this.props.onDurationChange({
      [event.target.name]: event.target.value
    });
  }

  render() {
    const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)'];
    return (
      <div className="form-inline">
        <input
          type="number"
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_duration_amount'}
          className="form-control calculator"
          placeholder="duration"
          ref={el => this.el = el}
          name="durationAmount"
          value={this.state.durationAmount}
          onChange={this.handleChange}
        />
        <button
          className="btn btn-secondary calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_duration_calc_button'}
          onClick={this.keyboardize}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title="for how long"
          rowID={this.props.rowID}
          parameterizedPlural={this.props.parameterizedPlural}
          name="durationUnit"
          value={this.state.durationUnit}
          onUnitChange={this.handleChange}
        />
      </div>
    );
  }
}

DurationField.propTypes = {
  topic: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
  parameterizedPlural: PropTypes.string.isRequired
};
