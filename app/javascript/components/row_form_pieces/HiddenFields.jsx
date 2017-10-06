import React from 'react';
import PropTypes from 'prop-types';
const parameterizedPlurals = require('./parameterizedPlurals');

export default class HiddenFields extends React.Component {
  render() {
    const parameterizedPlural = this.props.parameterizedPlural ? this.props.parameterizedPlural : parameterizedPlurals[this.props.topic.topic_type];
    return (
      <div>
        <input
          value={this.props.visit.patient_id}
          name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][patient_id]'}
          id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_patient_id'}
          type={'hidden'}
        />
        <input
          value={this.props.visit.id}
          name={'visit[' + parameterizedPlural +'_attributes][' + this.props.rowID + '][visit_id]'}
          id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_visit_id'}
          type={'hidden'}
        />
        <input
          value={this.props.topic.id}
          name={'visit[' + parameterizedPlural +'_attributes][' + this.props.rowID + '][topic_id]'}
          id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_topic_id'}
          className={'topic_id'}
          type={'hidden'}
        />
      </div>
    );
  }
}

HiddenFields.propTypes = {
  visit: PropTypes.object.isRequired,
  topic: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
  parameterizedPlural: PropTypes.string,
}
