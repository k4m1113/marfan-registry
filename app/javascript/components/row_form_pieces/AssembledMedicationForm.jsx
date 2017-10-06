import React from 'react';
import PropTypes from 'prop-types';
import HiddenFields from './HiddenFields';
import MedFormFields from './MedFormFields';

export default class AssembledMedicationForm extends React.Component {
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
