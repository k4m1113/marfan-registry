import React from 'react';
import PropTypes from 'prop-types';

export default class FileAttachmentButton extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      file: null,
    };
    this.handleFileChange = this.handleFileChange.bind(this);
  }

  handleFileChange(event) {
    this.props.onFileChange({
      [event.target.name]: event.target.value,
    })
  }

  render() {
    return (
      <div>
        <input
          name="file"
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_attachment'}
          style={{ display: 'none' }}
          type="file"
          onChange={this.handleFileChange}
          value={this.state.file}
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
