import React from 'react';
import PropTypes from 'prop-types';
import SelectConstructor from './SelectConstructor';

export default class MeasurementField extends React.Component {
  render() {
    const options = this.props.topic.units_of_measurement
    return (
      <div className="form-inline">
        <input
          type="number"
          name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][test_amount]'}
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_test_amount'}
          className='form-control calculator'
          min={this.props.topic.min_value}
          max={this.props.topic.max_value}
          step={this.props.topic.step}
          value=""
        />
        <button
          className="btn btn-secondary calculator"
          type="button"
          id={this.props.parameterizedPlural + '_' + this.props.rowID + '_test_calc_button'}
        >
          <i className="fa fa-calculator" />
        </button>
        <SelectConstructor
          arr={options}
          title={this.props.title}
          other={false}
          attribute="test_unit_of_meas"
          parameterizedPlural={this.props.parameterizedPlural}
          rowID={this.props.rowID}
          multiSelect={this.props.multiSelect}
        />
      </div>
    );
  }
}

MeasurementField.defaultProps = {
  title: 'units',
  multiSelect: false,
};

MeasurementField.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  multiSelect: PropTypes.bool.isRequired,
  title: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
