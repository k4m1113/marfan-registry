import React from 'react';
import PropTypes from 'prop-types';
import HiddenFields from './HiddenFields';
import MedFormFields from './MedFormFields';

export default class AssembledMedicationForm extends React.Component {
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
      dose: null,
      doseUnitOfMeasurement: null,
      dosageForm: null,
      dosageFormUnits: null,
      ingestionMethod: null,
      durationAmount: null,
      durationUnit: null,
      keywords: null,
      note: null,
      file: null,
    };
    this.handleChange = this.handleChange.bind(this)
  }

  componentWillUnmount() {
    console.log('medication form unmounting')
    debugger
  }

  handleChange(value) {
    this.setState({
      timeAgoAmount: value.timeAgoAmount || this.state.timeAgoAmount,
      timeAgoUnit: value.timeAgoUnit || this.state.timeAgoUnit,
      absoluteDate: value.absoluteDate || this.state.absoluteDate,
      dose: value.dose || this.state.dose,
      doseUnitOfMeasurement: value.doseUnitOfMeasurement || this.state.doseUnitOfMeasurement,
      dosageForm: value.dosageForm || this.state.dosageForm,
      dosageFormUnits: value.dosageFormUnits || this.state.dosageFormUnits,
      ingestionMethod: value.ingestionMethod || this.state.ingestionMethod,
      durationAmount: value.durationAmount || this.state.durationAmount,
      durationUnit: value.durationUnit || this.state.durationUnit,
      measurement: value.measurement || this.state.measurement,
      units: value.units || this.state.units,
      keywords: value.keywords || this.state.keywords,
      file: value.file || this.state.file,
      note: value.note || this.state.note,
    });
  }

  render() {
    const parameterizedPlural = 'medications'
    return (
      <tr className="row_form" id={'row_' + this.props.rowID}>
        <td colSpan="3">
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          <MedFormFields
            topic={this.props.topic}
            rowID={this.props.rowID}
            onMedFormChange={this.handleChange}
          />
        </td>
      </tr>
    );
  }
}

AssembledMedicationForm.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired
};
