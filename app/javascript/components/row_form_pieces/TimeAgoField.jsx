import React from 'react';
import PropTypes from 'prop-types';
import Switch from 'react-bootstrap-switch';
import ToggleDisplay from 'react-toggle-display';
import $ from 'jquery';
import SelectConstructor from './SelectConstructor';
require('../addKeyboard');
require('jquery-ujs');
require('jquery-ui/ui/core.js');
require('jquery-ui/ui/position');

export default class TimeAgoField extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      show: true,
      timeAgoAmount: this.props.timeAgoAmount,
      timeAgoUnit: this.props.timeAgoUnit,
      absoluteDate: this.props.absoluteDate,
    };
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
    this.props.onDateChange({
      [event.target.name]: event.target.value
    });
  }

  handleSwitch(elem, state) {
    this.setState({ show: state });
  }

  render() {
    const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)'];
    let absoluteTime;
    switch (this.props.topic.topic_type) {
      case 'test':
        absoluteTime = 'absolute_start_date';
        break;
      case 'hospitalization':
        absoluteTime = 'admission_date';
        break;
      default:
        absoluteTime = 'absolute_start_date';
    }
    return (
      <div className="row">
        <Switch
          onChange={(el, state) => this.handleSwitch(el, state)}
          name="approxToggle"
          onText="Approx"
          offText="Exact"
        />
        <br />
        <ToggleDisplay show={this.state.show}>
          <div className="approximate" >
            <div className="form-inline">
              <input
                type="number"
                name="timeAgoAmount"
                id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_time_ago_amount'}
                className='form-control calculator'
                placeholder="time ago"
                ref={el => this.el = el}
                value={this.state.timeAgoAmount}
                onChange={this.handleChange}
              />
              <button
                className="btn btn-secondary calculator"
                type="button"
                id={this.props.parameterizedPlural + '_' + this.props.rowID + '_time_calc_button'}
                onClick={this.keyboardize}
              >
                <i className="fa fa-calculator" />
              </button>
              <SelectConstructor
                arr={options}
                title="time ago"
                rowID={this.props.rowID}
                parameterizedPlural={this.props.parameterizedPlural}
                name="timeAgoUnit"
                value={this.state.timeAgoUnit}
                onUnitChange={this.handleChange}
              />
            </div>
          </div>
        </ToggleDisplay>
        <ToggleDisplay show={!this.state.show}>
          <div className="exact">
            <input
              type="date"
              name="absoluteDate"
              id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + absoluteTime}
              className="form-control"
              value={this.state.absoluteDate}
              onChange={this.handleChange}
            />
          </div>
        </ToggleDisplay>
      </div>
    );
  }
}

TimeAgoField.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
