import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import HiddenFields from './HiddenFields';
import MeasurementField from './MeasurementField';
import Keywords from './Keywords';
import NoteField from './NoteField';

export default class AssembledHeartMeasurementForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      topic: this.props.topic.id,
      patient: this.props.visit.patient_id,
      visit: this.props.visit.id,
      measurement: null,
      units: null,
      timeAgoAmount: null,
      timeAgoUnit: null,
      absoluteDate: null,
      keywords: null,
      note: null,
      file: null,
    };
    this.handleChange = this.handleChange.bind(this)
  }

  componentWillUnmount() {
    console.log('heart measurement form unmounting')
    debugger
  }

  handleChange(value) {
    this.setState({
      timeAgoAmount: value.timeAgoAmount || this.state.timeAgoAmount,
      timeAgoUnit: value.timeAgoUnit || this.state.timeAgoUnit,
      absoluteDate: value.absoluteDate || this.state.absoluteDate,
      measurement: value.measurement || this.state.measurement,
      units: value.units || this.state.units,
      file: value.file || this.state.file,
      note: value.note || this.state.note,
    });
    if (this.props.topic.units_of_measurement.length === 1 && this.state.measurement) {
      this.setState({
        units: this.props.topic.units_of_measurement[0],
      });
    }
  }

  render() {
    const parameterizedPlural = 'heart_measurements';
    let measFields;
    let descriptors;
    if (this.props.topic.units_of_measurement.length === 1 || !this.props.topic.name.includes('morphology')) {
      measFields = (
        <MeasurementField
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          rowID={this.props.rowID}
          title="severity"
          measurementValue={this.state.measurement}
          unitOfMeas={this.state.units}
          onMeasChange={this.handleChange}
        />
      );
    } else {
      measFields = (
        <MeasurementField
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          multiSelect
          rowID={this.props.rowID}
          title="morphology"
          measurementValue={this.state.measurement}
          unitOfMeas={this.state.units}
          onMeasChange={this.handleChange}
        />
      );
    }
    if (this.props.topic.descriptors) {
      descriptors = (
        <Keywords
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          rowID={this.props.rowID}
          keywordsValue={this.state.keywords}
          onKeywordsChange={this.handleChange}
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
            noteValue={this.state.note}
            onNoteChange={this.handleChange}
          />
          <FileAttachmentButton
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
            attachedFile={this.state.file}
            onFileChange={this.handleChange}
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
