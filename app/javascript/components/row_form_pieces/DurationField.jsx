import React from 'react';
import PropTypes from 'prop-types';
import SelectConstructor from './SelectConstructor';

export default class DurationField extends React.Component {
  render() {
    const options = ['second(s)', 'minute(s)', 'hour(s)', 'day(s)', 'week(s)', 'month(s)', 'year(s)'];
    return (
      <div className="form-inline">
        <input
          type="number"
          name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][duration_amount]'}
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_duration_amount'}
          className="form-control calculator"
          placeholder="duration"
        />
        <button
          className="btn btn-secondary calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_duration_calc_button'}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title="for how long"
          attribute="duration_scale"
          parameterizedPlural={this.props.parameterizedPlural}
          rowID={this.props.rowID}
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
