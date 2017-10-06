import React from 'react';
import PropTypes from 'prop-types';

export default class NoteField extends React.Component {
  render() {
    return (
      <div>
        <textarea
          placeholder="note"
          name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][note]'}
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_note'}
          className="form-control"
          value=""
          rows="1"
        />
        <button
          className="btn btn-secondary"
          data-toggle="modal"
          data-target={'#row_' + this.props.rowID + '_scribble_modal'}
          type="button"
        >
          <i className="fa fa-pencil" />
        </button>
      </div>
    );
  }
}

NoteField.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
