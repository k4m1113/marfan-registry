import React from 'react';
import PropTypes from 'prop-types';
import SelectConstructor from './SelectConstructor';

export default class FrequencyField extends React.Component {
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
        />
        <button
          className="btn btn-secondary calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_freq_calc_button'}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title="times per"
          attribute="frequency_scale"
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
