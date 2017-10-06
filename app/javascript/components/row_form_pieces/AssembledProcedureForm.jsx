import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import FindRelated from './FindRelated';
import HiddenFields from './HiddenFields';
import Keywords from './Keywords';
import NoteField from './NoteField';
import TimeAgoField from './TimeAgoField';

export default class AssembledProcedureForm extends React.Component {
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
              />
              <FileAttachmentButton
                topic={this.props.topic}
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
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
