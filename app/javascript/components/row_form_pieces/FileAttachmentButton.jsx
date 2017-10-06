import React from 'react';
import PropTypes from 'prop-types';

export default class FileAttachmentButton extends React.Component {
  render() {
    return (
      <div>
        <input
          name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][attachment]'}
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_attachment'}
          style={{ display: 'none' }}
          type="file"
        />
        <button className="btn btn-secondary file-attachment" type="button">
          <label
            htmlFor={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_attachment'}
            className="fontawesome-icon"
          >
            <i className="fa fa-camera" />
          </label>
        </button>
      </div>
    );
  }
}

FileAttachmentButton.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
