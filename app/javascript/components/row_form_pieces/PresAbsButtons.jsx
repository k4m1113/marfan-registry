import React from 'react';
import PropTypes from 'prop-types';
import InfoHover from './InfoHover';
import HiddenFields from './HiddenFields';

const parameterizedPlurals = require('./parameterizedPlurals');
export default class PresAbsButtons extends React.Component {
  constructor(props) {
    super(props);
    this.state = { show: false };
    this.handleChange = this.handleChange.bind(this);
  }
  handleChange(e) {
    this.props.onShowChange(e.target.value);
  }
  render() {
    const show = this.props.show
    const parameterizedPlural = parameterizedPlurals[this.props.topic.topic_type]
    const concerns = JSON.parse(this.props.visit.concerns)
    const discussedConcerns = concerns.map(x => x.topic_id)
    const discussed = discussedConcerns.includes(this.props.topic.id) ? ' red' : ''
    let existing;
    if (discussed) {
      existing = concerns.filter(x => x.topic_id === this.props.topic.id);
      return (<InfoHover concerns={concerns} />);
    }
    return (
      <tr className="presAbs">
        <td>
          <input
            value={this.props.visit.patient_id}
            name={'visit[' + parameterizedPlural + '_attributes][' + this.props.topic.id + '][patient_id]'}
            id={'visit_' + parameterizedPlural + '_attributes_' + this.props.topic.id + '_patient_id'}
            type="hidden"
            />
          <input
            value={this.props.visit.id}
            name={'visit[' + parameterizedPlural + '_attributes][' + this.props.topic.id + '][visit_id]'}
            id={'visit_' + parameterizedPlural + '_attributes_' + this.props.topic.id + '_visit_id'}
            type="hidden"
            />
          <input
            value={this.props.topic.id}
            name={'visit[' + parameterizedPlural + '_attributes][' + this.props.topic.id + '][topic_id]'}
            id={'visit_' + parameterizedPlural + '_attributes_' + this.props.topic.id + '_topic_id'}
            type="hidden"
            />
          {this.props.topic.name}
          {existing}
        </td>
        <div className="pull-right">
          <td>
            <label className="btn left-30" onClick={this.handleChange} value="true">
              <input
                name={'visit[' + parameterizedPlural + '_attributes][' + this.props.topic.id + '][present]'}
                id={'visit_' + parameterizedPlural + '_attributes_' + this.props.topic.id + '_present_true'}
                className="pres_abs"
                type="radio"
                value="true"
              />
              <i className="fa fa-circle-o fa-2x" />
              <i className="fa fa-check-circle-o fa-2x" />
            </label>
          </td>
          <td>
            <label className="btn left-30" onClick={this.handleChange} value="false">
              <input
                name={'visit[' + parameterizedPlural + '_attributes][' + this.props.topic.id + '][present]'}
                id={'visit_' + parameterizedPlural + '_attributes_' + this.props.topic.id + '_present_false'}
                className="pres_abs"
                type="radio"
                value="false"
              />
            <i className="fa fa-circle-o fa-2x" />
              <i className="fa fa-check-circle-o fa-2x" />
            </label>
          </td>
        </div>
      </tr>
    );
  }
}

PresAbsButtons.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
};
