import React, { Component } from 'react';
import PropTypes from 'prop-types';
import AssembledHeartMeasurementForm from '../row_form_pieces/AssembledHeartMeasurementForm'

export default class AorticImaging extends Component {
  render() {
    const fields = this.props.topics.map(t => (
      <AssembledHeartMeasurementForm
        key={t.name}
        topic={t}
        rowID={t.id}
        visit={this.props.visit}
      />
    ));
    return (
      <div>
        {fields}
      </div>
    );
  }
}

AorticImaging.propTypes = {
  topics: PropTypes.array.isRequired,
  visit: PropTypes.object.isRequired
};
