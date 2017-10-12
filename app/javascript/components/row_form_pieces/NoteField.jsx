import React from 'react';
import PropTypes from 'prop-types';

export default class NoteField extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      note: null,
    };
    this.handleNoteChange = this.handleNoteChange.bind(this);
  }

  handleNoteChange(event) {
    this.props.onNoteChange({
      [event.target.name]: event.target.value,
    })
  }

  render() {
    return (
      <div>
        <textarea
          placeholder="note"
          name="note"
          id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_note'}
          className="form-control"
          value={this.state.note}
          onChange={this.handleNoteChange}
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
