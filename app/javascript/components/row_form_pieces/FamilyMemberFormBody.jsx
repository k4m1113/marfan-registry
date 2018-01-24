import React, { Component } from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';

const reasonsForDeath = ['', 'aortic dissection', 'heart attack', 'stroke', 'cancer', 'old age', 'Alzheimer\'s', 'dementia']

export default class FamilyMemberFormBody extends Component {
  render () {
    let minValue = ''
    let maxValue = ''
    let today = new Date
    today = today.getFullYear()
    const patientAge = today -  parseInt(this.props.patient.date_of_birth.slice(0, 4))
    if (this.props.topic.name === "parent") {
      minValue = patientAge + 10
      maxValue = 110
    } else if (this.props.topic.name === "child") {
      minValue = 0
      maxValue = patientAge
    }
    const parameterizedPlural = 'family_members';
    const deathOptions = reasonsForDeath.map(x => <option key={'death_' + x}>{x}</option>);

    return (
      <div>
        <input
          type="hidden"
          id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_claimed_patient_id'}
          name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][claimed_patient_id]'}
          className="claimed_patient_id"
          value=""
        />
        <div className="form-group row">
          <div className="col-4 col-form-label">
            First Name
          </div>
          <div className="col-8">
            <input
              type="text"
              id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_first_name'}
              name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][future_patient_data_hash][first_name]'}
              className="form-control first_name"
            />
          </div>
        </div>
        <div className="form-group row">
          <div className="col-4 col-form-label">
            Last Name
          </div>
          <div className="col-8">
            <input
              type="text"
              id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_last_name'}
              name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][future_patient_data_hash][last_name]'}
              className="form-control last_name"
            />
          </div>
        </div>
        <div className="form-group row">
          <div className="col-4 col-form-label">
            Age
          </div>
          <div className="col-8 form-inline">
            <input
              type="number"
              id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_born_years_ago'}
              name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][future_patient_data_hash][born_years_ago]'}
              className="form-control age"
              min={minValue}
              max={maxValue}
              step="1"
            />
            <label htmlFor={'deceased' + this.props.rowID}>
              <input
                id={'deceased' + this.props.rowID}
                type="checkbox"
                className="deceased"
              />
              Deceased
            </label>
          </div>
        </div>

        <div className="deceased_details" style={{ display: 'none' }}>
          <div className="form-group row">
            <div className="col-4 col-form-label">
              Cause of Death
            </div>
            <div className="col-8">
              <select
                id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_cause_of_death'}
                name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][future_patient_data_hash][cause_of_death]'}
                className="form-control"
              >
                {deathOptions}
              </select>
            </div>
          </div>
        </div>
        <div className="form-group row">
          <div className="col-4 col-form-label">
            Note
          </div>
          <div className="col-8 form-inline">
            <textarea
              placeholder='note'
              name={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_note'}
              id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_future_patient_data_hash_note'}
              className='form-control note'
              rows="1"
            />
            <FileAttachmentButton
              topic={this.props.topic}
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>
        <div className="form-group row">
          <div className="col-4 col-form-label">
            Known Concerns
          </div>
          <div className="col-8">
            <select
              id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_concerns'}
              name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][concerns][]'}
              className="knownConcerns form-control"
              style={{ width: '100%' }}
              multiple
            />
          </div>
        </div>
      </div>
    );
  }
}

FamilyMemberFormBody.propTypes = {
  topic: PropTypes.object.isRequired,
  patient: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
