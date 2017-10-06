import React from 'react';
import PropTypes from 'prop-types';
import Switch from 'react-bootstrap-switch';
import ToggleDisplay from 'react-toggle-display';
import SelectConstructor from './SelectConstructor';

export default class TimeAgoField extends React.Component {
  constructor() {
    super();
    this.state = { show: true };
  }

  handleSwitch(elem, state) {
    this.setState({ show: state })
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
      <div>
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
                name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][time_ago_amount]'}
                id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_time_ago_amount'}
                className='form-control calculator'
                placeholder="time ago"
              />
              <button
                className="btn btn-secondary calculator"
                type="button"
                id={this.props.parameterizedPlural + '_' + this.props.rowID + '_time_calc_button'}
              >
                <i className="fa fa-calculator" />
              </button>
              <SelectConstructor
                arr={options}
                title="time ago"
                attribute="time_ago_scale"
                parameterizedPlural={this.props.parameterizedPlural}
                rowID={this.props.rowID}
              />
            </div>
          </div>
        </ToggleDisplay>
        <ToggleDisplay show={!this.state.show}>
          <div className="exact">
            <input
              type="date"
              name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][' + absoluteTime + ']'}
              id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + absoluteTime}
              className="form-control"
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
