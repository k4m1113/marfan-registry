import React from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import HiddenFields from './HiddenFields';
import MeasurementField from './MeasurementField';

export default class AssembledVitalForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      topic: this.props.topic.id,
      patient: this.props.visit.patient_id,
      visit: this.props.visit.id,
      measurement: null,
      units: null,
    };
    this.handleChange = this.handleChange.bind(this)
    this.ajaxData = this.ajaxData.bind(this)
  }

  componentWillUnmount(event) {
    $.ajax({
      type: 'PUT',
      url: `/visits/${this.state.visit}.json`,
      data: JSON.stringify(this.ajaxData()),
      contentType: 'application/json',
      dataType: 'json',
      success: response => console.log('SUCCESS', response),
      error: response => console.log('ERROR!!1!!!!11!', response),
    });
  }

  handleChange(value) {
    this.setState({
      measurement: value.measurement || this.state.measurement,
      units: value.units || this.state.units,
    });
  }

  ajaxData() {
    return {
      visit: {
        id: this.state.visit,
        vitals_attributes: [{
          visit_id: this.state.visit,
          patient_id: this.state.patient,
          topic_id: this.state.topic,
          measurement: `${this.state.measurement} ${this.state.units}`,
        }],
      },
    };
  }

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
            measurementValue={this.state.measurement}
            unitOfMeas={this.state.units}
            onMeasChange={this.handleChange}
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
