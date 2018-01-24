import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class Keywords extends Component {
  constructor(props) {
    super(props);
    this.state = {
      keywords: null,
    };
    this.handleKeywordsChange = this.handleKeywordsChange.bind(this);
  }

  handleKeywordsChange(event) {
    this.props.onKeywordsChange({
      [event.target.name]: event.target.value,
    })
  }

  render() {
    let descriptors;
    if (this.props.topic.descriptors) {
      descriptors = this.props.topic.descriptors.map(descriptor =>
        (
          <label key={descriptor + '_' + this.props.rowID} className="form-check-label descriptor">
            <input
              className="form-check-input"
              type="checkbox"
              name="keywords"
              id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_descriptors_' + descriptor}
              value={this.state.keywords}
              onChange={this.handleKeywordsChange}
            />
            {descriptor}
          </label>
        ),
      );
    }
    return (
      <div className="form-inline descriptors">
        {descriptors}
      </div>
    );
  }
}

Keywords.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
