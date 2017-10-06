import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import FindRelated from './FindRelated';
import HiddenFields from './HiddenFields';
import NoteField from './NoteField';
import TimeAgoField from './TimeAgoField';
import SelectConstructor from './SelectConstructor';

export default class AssembledDissectionForm extends React.Component {
  render() {
    const locations = ['aortic root', 'ascending aorta', 'arch', 'descending thoracic', 'suprarenal abdominal', 'infrarenal abdominal', 'iliac', 'renal', 'SMA', 'celiac', 'innominate', 'left carotid', 'left subclavian'];
    const perfused = ['perfused', 'ischemic'];
    const lumens = ['true lumen', 'false lumen', 'dissected'];
    const directions = ['right', 'left', 'N/A'];
    const parameterizedPlural = 'dissections';
    return (
      <tr className="row_form" id={'row_' + this.props.rowID}>
        <td colSpan={3}>
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          <div className="form-inline">
            <SelectConstructor
              arr={locations}
              title="location"
              attribute="location"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
            <SelectConstructor
              arr={directions}
              title="direction"
              attribute="direction"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
            <SelectConstructor
              arr={lumens}
              title="lumen"
              attribute="lumen"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
            <SelectConstructor
              arr={perfused}
              title="perfusion"
              attribute="perfusion"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
          <div className="form-inline">
            <TimeAgoField
              topic={this.props.topic}
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
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
            What type of intervention was performed?
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

AssembledDissectionForm.propTypes = {
  unsortedTopics: PropTypes.array.isRequired,
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
