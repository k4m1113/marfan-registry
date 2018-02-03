import React, { Component } from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import FindRelated from './FindRelated';
import HiddenFields from './HiddenFields';
import Keywords from './Keywords';
import NoteField from './NoteField';
import TimeAgoField from './TimeAgoField';

export default class AssembledProcedureForm extends Component {
  constructor(props) {
    super(props);
    this.state = {
      topic: this.props.topic.id,
      patient: this.props.visit.patient_id,
      visit: this.props.visit.id,
      timeAgoAmount: null,
      timeAgoUnit: null,
      absoluteDate: null,
      keywords: null,
      note: null,
      file: null,
    };
    this.handleChange = this.handleChange.bind(this)
  }

  componentWillUnmount() {
    console.log('procedure form unmounting')
    // debugger
  }

  handleChange(value) {
    this.setState({
      timeAgoAmount: value.timeAgoAmount || this.state.timeAgoAmount,
      timeAgoUnit: value.timeAgoUnit || this.state.timeAgoUnit,
      absoluteDate: value.absoluteDate || this.state.absoluteDate,
      keywords: value.keywords || this.state.keywords,
      file: value.file || this.state.file,
      note: value.note || this.state.note,
    });
  }

  render() {
    const parameterizedPlural = 'procedures'
    let descriptors
    if (this.props.topic.descriptors) {
      descriptors = (
        <div className="form-group row">
          <label className="col-2 col-form-label">Descriptors</label>
          <div className="form-inline col-10">
            <Keywords
              topic={this.props.topic}
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              keywordsValue={this.state.keywords}
              onKeywordsChange={this.handleChange}
            />
          </div>
        </div>
      );
    }
    return (
      <tr className="row_form" id={'row_' + this.props.rowID}>
        <td colSpan="3">
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          {descriptors}
          <div className="form-group row">
            <label className="col-2 col-form-label">Date</label>
            <div className="form-inline col-10">
              <TimeAgoField
                topic={this.props.topic}
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
                timeAgoAmount={this.state.timeAgoAmount}
                timeAgoUnit={this.state.timeAgoUnit}
                absoluteDate={this.state.absoluteDate}
                onDateChange={this.handleChange}
              />
            </div>
          </div>
          <div className="form-group row">
            <label className="col-2 col-form-label">Note</label>
            <div className="form-inline col-10">
              <NoteField
                topic={this.props.topic}
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
                noteValue={this.state.note}
                onNoteChange={this.handleChange}
              />
              <FileAttachmentButton
                topic={this.props.topic}
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
                attachedFile={this.state.file}
                onFileChange={this.handleChange}
              />
            </div>
          </div>
          <FindRelated
            topic={this.props.topic}
            unsortedTopics={this.props.unsortedTopics}
          />
        </td>
      </tr>
    );
  }
}

AssembledProcedureForm.propTypes = {
  unsortedTopics: PropTypes.array.isRequired,
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired
};
