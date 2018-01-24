import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class ReasonForVisitHeader extends Component {
  render() {
    const reasonsForVisit = [
      'flu',
      'checkup',
      'initial visit',
      'family history',
      'aortic imaging',
      'chest pain'
    ];
    const options = reasonsForVisit.map(r => (
      <div>
        <label
          className="btn btn-secondary"
          id={'label_primary_reason_' + r.replace(' ', '_')}
        >
          <input
            type="radio"
            autocomplete="off"
            name="visit[primary_reason]"
            value={r}
          />
          {r}
        </label>
      </div>
    ),
    );
    return (
      <div className="alert alert-warning alert-dismissible fade show" role="alert">
        <button type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        Reason for Visit:
        {options}
      </div>
    );
  }
}

ReasonForVisitHeader.propTypes = {
  visit: PropTypes.object.isRequired,
};
