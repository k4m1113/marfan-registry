import React from 'react';
import ReactDOM from 'react-dom'

export default class PrimaryReasonButton extends React.Component {
  render() {
    const diagnosis = this.props.diagnosis
    return (
      <label className="btn btn-secondary">
        <input type="radio" autoComplete="off" name="visit[patient_attributes][primary_diagnosis]" value={diagnosis} />
        {diagnosis}
      </label>
    );
  }
}
