import React, { Component } from 'react';
import PropTypes from 'prop-types';
import BloodPressureForm from './BloodPressureForm';
import HiddenFields from './HiddenFields';
import MeasurementField from './MeasurementField';

export default class AssembledVitalForm extends Component {
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
    const data = JSON.stringify(this.ajaxData())
    fetch(`/visits/${this.state.visit}.json`, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: data
    })
    .then(function(response) {
      console.log(response.json())
    })
    .then(function(data){ alert( JSON.stringify( data ) ) })
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
    var form;
    if (this.props.topic.name == 'blood pressure') {
      form = (
        <BloodPressureForm
          visit={this.props.visit}
          topic={this.props.topic}
          parameterizedPlural={parameterizedPlural}
          title={this.props.topic.name}
          rowID={this.props.rowID}
          measurementValue={this.state.measurement}
          unitOfMeas={this.state.units}
          onMeasChange={this.handleChange}
        />
      )
    }
    else {
      form = (
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
      )
    }

    return (
      <div className="form-group row">
        <label className="col-2 col-form-label">
          {this.props.topic.name}
        </label>
        {form}
      </div>
    );
  }
}

AssembledVitalForm.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
