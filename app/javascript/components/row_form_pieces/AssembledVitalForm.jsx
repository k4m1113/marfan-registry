import React from 'react';
import PropTypes from 'prop-types';
import HiddenFields from './HiddenFields';
import MeasurementField from './MeasurementField';

export default class AssembledVitalForm extends React.Component {
  render() {
    const parameterizedPlural = 'vitals'
    return (
      <div className="form-group row">
        <label className="col-2 col-form-label">
          {this.props.topic.name}
        </label>
        <div className="form-inline col-10">
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          <MeasurementField
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            title={this.props.topic.name}
            rowID={this.props.rowID}
          />
        </div>
      </div>
    );
  }
}

AssembledVitalForm.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
