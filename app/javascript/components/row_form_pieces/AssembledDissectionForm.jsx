import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import FindRelated from './FindRelated';
import HiddenFields from './HiddenFields';
import NoteField from './NoteField';
import TimeAgoField from './TimeAgoField';
import SelectConstructor from './SelectConstructor';

export default class AssembledDissectionForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      topic: this.props.topic.id,
      patient: this.props.visit.patient_id,
      visit: this.props.visit.id,
      timeAgoAmount: null,
      timeAgoUnit: null,
      absoluteDate: null,
      location: null,
      direction: null,
      lumen: null,
      perfusion: null,
      note: null,
      file: null,
    };
    this.handleChange = this.handleChange.bind(this)
    this.handleSelectChange = this.handleSelectChange.bind(this)
  }

  componentWillUnmount() {
    console.log('dissection form unmounting')
    debugger
  }

  handleChange(value) {
    this.setState({
      timeAgoAmount: value.timeAgoAmount || this.state.timeAgoAmount,
      timeAgoUnit: value.timeAgoUnit || this.state.timeAgoUnit,
      absoluteDate: value.absoluteDate || this.state.absoluteDate,
      file: value.file || this.state.file,
      note: value.note || this.state.note,
    });
  }

  handleSelectChange(e) {
    const target = e.target;
    this.setState({
      [target.name]: target.value,
    });
    debugger
  }

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
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="location"
              value={this.state.location}
              onUnitChange={this.handleSelectChange}
            />
            <SelectConstructor
              arr={directions}
              title="direction"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="direction"
              value={this.state.direction}
              onUnitChange={this.handleSelectChange}
            />
            <SelectConstructor
              arr={lumens}
              title="lumen"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="lumen"
              value={this.state.lumen}
              onUnitChange={this.handleSelectChange}
            />
            <SelectConstructor
              arr={perfused}
              title="perfusion"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="perfusion"
              value={this.state.perfusion}
              onUnitChange={this.handleSelectChange}
            />
          </div>
          <div className="form-inline">
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
          <div className="form-inline">
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
