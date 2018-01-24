import React, { Component } from 'react';
import PropTypes from 'prop-types';
import HiddenFields from './HiddenFields';
import FamilyMemberFormBody from './FamilyMemberFormBody';

export default class AssembledFamilyMemberForm extends Component {
  render() {
    let returnStatement;
    if (this.props.person.future_patient_data_hash.first_name.length) {
      returnStatement = this.props.person.future_patient_data_hash.first_name;
    } else {
      returnStatement = (
        <div>
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={'family_members'}
            rowID={this.props.topic.id}
          />
          <FamilyMemberFormBody
            topic={this.props.topic}
            patient={this.props.patient}
            rowID={this.props.topic.id}
          />
        </div>
      );
    }
    return (
      returnStatement
    );
  }
}

AssembledFamilyMemberForm.propTypes = {
  topic: PropTypes.object.isRequired,
  person: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  patient: PropTypes.object.isRequired
};
