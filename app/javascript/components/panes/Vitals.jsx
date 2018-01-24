import React, { Component } from 'react';
import PropTypes from 'prop-types';
import AssembledVitalForm from '../row_form_pieces/AssembledVitalForm'

export default class Vitals extends Component {
  render() {
    const fields = this.props.topics.map(t =>
      (
        <AssembledVitalForm
          key={t.name}
          topic={t}
          visit={this.props.visit}
          rowID={t.id}
        />
      ),
    );
    return (
      <div>
        {fields}
      </div>
    );
  }
}

Vitals.propTypes = {
  topics: PropTypes.array.isRequired,
  visit: PropTypes.object.isRequired,
};
