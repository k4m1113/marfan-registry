import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class InfoHover extends Component {
  render() {
    const tooltipTitle = this.props.concerns.map(x => x.summary)

    return (
      <button
        type="button"
        className="btn btn-light tooltip-trigger"
        data-toggle="tooltip"
        data-html="true"
        title={tooltipTitle}
      >
        <i className="fa fa-history" aria-hidden="true" />
      </button>
    );
  }
}

InfoHover.propTypes = {
  concerns: PropTypes.object.isRequired,
};
