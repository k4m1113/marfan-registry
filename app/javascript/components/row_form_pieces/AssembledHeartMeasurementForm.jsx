import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import HiddenFields from './HiddenFields';
import MeasurementField from './MeasurementField';
import Keywords from './Keywords';
import NoteField from './NoteField';

export default class AssembledHeartMeasurementForm extends React.Component {
  render() {
    const parameterizedPlural = 'heart_measurements';
    let measFields;
    let descriptors;
    if (this.props.topic.units_of_measurement.length === 1 || !this.props.topic.name.includes('morphology')) {
      measFields = (
        <MeasurementField
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          title="severity"
          rowID={this.props.rowID}
        />
      );
    } else {
      measFields = (
        <MeasurementField
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          multiSelect
          title="morphology"
          rowID={this.props.rowID}
        />
      );
    }
    if (this.props.topic.descriptors) {
      descriptors = (
        <Keywords
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          rowID={this.props.rowID}
        />
      );
    }
    return (
      <div className="form-group row">
        <div className="col-3 col-form-label">
          {this.props.topic.name}
        </div>
        <div className="col-9 form-inline">
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          {measFields}
          {descriptors}
          <NoteField
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          <FileAttachmentButton
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
        </div>
      </div>
    );
  }
}

AssembledHeartMeasurementForm.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
