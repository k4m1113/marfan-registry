import React, { Component } from 'react';
import ReactDOM from 'react-dom';

export default class PrimaryReasonButton extends Component {
  render() {
    const diagnosis = this.props.diagnosis;
    return (
      <div style={{ display: 'inline-block' }}>
        <label className="btn btn-secondary btn-sm">
          <input
            type="radio"
            autoComplete="off"
            name="visit[patient_attributes][primary_diagnosis]"
            value={diagnosis}
          />
          {diagnosis}
        </label>
      </div>
    );
  }
}
