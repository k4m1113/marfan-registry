import React from 'react';
import PropTypes from 'prop-types';
import ToggleDisplay from 'react-toggle-display';
import AssembledDiagnosisForm from './AssembledDiagnosisForm';
import AssembledDissectionForm from './AssembledDissectionForm';
import AssembledGeneticTestForm from './AssembledGeneticTestForm';
import AssembledHeartMeasurementForm from './AssembledHeartMeasurementForm';
import AssembledHospitalizationForm from './AssembledHospitalizationForm';
import AssembledMeasurementForm from './AssembledMeasurementForm';
import AssembledMedicationForm from './AssembledMedicationForm';
import AssembledProcedureForm from './AssembledProcedureForm';
import AssembledVitalForm from './AssembledVitalForm';
import FindRelated from './FindRelated'
import PresAbsButtons from './PresAbsButtons';

const parameterizedPlurals = require('./parameterizedPlurals');

export default class RowForm extends React.Component {
  constructor(props) {
    super(props);
    this.handleShowChange = this.handleShowChange.bind(this);
    this.state = { show: false };
  }

  handleShowChange(bool) {
    this.setState({ show: (bool === 'true') })
  }

  render() {
    let form;
    const toggleable = (
      <PresAbsButtons
        onShowChange={this.handleShowChange}
        topic={this.props.topic}
        visit={this.props.visit}
      />
    );
    switch (this.props.topic.topic_type) {
      case 'diagnosis':
        form = (
          <AssembledDiagnosisForm
            topic={this.props.topic}
            allTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            rowID={this.props.rowID}
          />
        );
        break;
      case 'dissection':
        form = (
          <AssembledDissectionForm
            topic={this.props.topic}
            unsortedTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            rowID={this.props.topic.id}
          />
        );
        break;
      // case 'family member':
      //   form = 'FAMILY MEMBER FORM';
      //   break;
      case 'genetic test':
        form = (
          <AssembledGeneticTestForm
            topic={this.props.topic}
            rowID={this.props.rowID}
            visit={this.props.visit}
          />
        );
        break;
      case 'hospitalization':
        form = (
          <AssembledHospitalizationForm
            topic={this.props.topic}
            unsortedTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            rowID={this.props.rowID}
          />
        );
        break;
      case 'measurement':
        form = (
          <AssembledMeasurementForm
            topic={this.props.topic}
            unsortedTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            rowID={this.props.rowID}
          />
        );
        break;
      case 'medication':
        form = (
          <AssembledMedicationForm
            topic={this.props.topic}
            rowID={this.props.rowID}
            visit={this.props.visit}
          />
        );
        break;
      case 'procedure':
        form = (
          <AssembledProcedureForm
            topic={this.props.topic}
            unsortedTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            rowID={this.props.rowID}
          />
        );
        break;
      // case 'vital':
      //   form = (
      //     <FindRelated
      //       topic={this.props.topic}
      //       unsortedTopics={this.props.unsortedTopics}
      //     />
      //   )
      //   break;
      // case 'heart_measurement':
      //   form = (
      //     <FindRelated
      //       topic={this.props.topic}
      //       unsortedTopics={this.props.unsortedTopics}
      //     />
      //   )
      //   break;
      default:
    }
    return (
      <tr>
        {toggleable}
        <ToggleDisplay show={this.state.show}>
          {form}
        </ToggleDisplay>
      </tr>
    );
  }
}

RowForm.propTypes = {
  rowID: PropTypes.number.isRequired,
  topic: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
  visit: PropTypes.object.isRequired,
};
