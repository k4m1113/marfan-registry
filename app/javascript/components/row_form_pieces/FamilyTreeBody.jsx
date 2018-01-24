import React, { Component } from 'react';
import PropTypes from 'prop-types';
import AssembledFamilyMemberForm from './AssembledFamilyMemberForm';

export default class FamilyTreeBody extends Component {
  render() {
    const relationship = this.props.topic.name;
    let title = '';
    if (this.props.person.future_patient_data_hash.first_name.length) {
      switch (this.props.field) {
        case 'name':
          title = `${this.props.person.future_patient_data_hash.first_name}`;
          break;
        case 'details':
          title = `${this.props.person.note}`;
          break;
        default:

      }
    } else {
      title = `${relationship} ${this.props.field}`;
    }
    return (
      <div>
        <div data-target={'#' + relationship + this.props.index + 'Modal'} data-toggle="modal">
          {title}
        </div>
        <div className="modal family" id={relationship + this.props.index + 'Modal'} tabIndex="-1" role="dialog" aria-labelledby={relationship + this.props.index + 'Label'} aria-hidden="true">
          <div className="modal-dialog" role="document">
            <div className="modal-content">
              <div className="modal-header">
                <h5 className="modal-title form-inline" id={relationship + this.props.index + 'Label'}>
                  {relationship} {this.props.index}
                  &nbsp
                  <select className="existingPatient form-control" id={'existing' + this.props.index}>
                    <option />
                  </select>
                </h5>
                <button type="button" className="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div className="modal-body">
                <AssembledFamilyMemberForm
                  topic={this.props.topic}
                  person={this.props.person}
                  visit={this.props.visit}
                  patient={this.props.patient}
                />
              </div>
              <div className="modal-footer">
                <button type="button" className="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" className="btn btn-primary">
                Save {this.props.topic.name} {this.props.index}
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  }
}

FamilyTreeBody.propTypes = {
  person: PropTypes.object.isRequired,
  topic: PropTypes.object.isRequired,
  field: PropTypes.string.isRequired,
  index: PropTypes.number.isRequired,
  patient: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
};
