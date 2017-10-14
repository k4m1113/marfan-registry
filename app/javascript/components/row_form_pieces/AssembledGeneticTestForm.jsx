import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import HiddenFields from './HiddenFields';
import NoteField from './NoteField';
import SelectConstructor from './SelectConstructor';
import TimeAgoField from './TimeAgoField';

export default class AssembledGeneticTestForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      topic: this.props.topic.id,
      patient: this.props.visit.patient_id,
      visit: this.props.visit.id,
      timeAgoAmount: null,
      timeAgoUnit: null,
      absoluteDate: null,
      lab: null,
      labClassification: null,
      clinicalClassification: null,
      predictiveTestingRecommended: null,
      transcript: null,
      protein: null,
      variant: null,
      exons: null,
      note: null,
      file: null,
    };
    this.handleChange = this.handleChange.bind(this);
  }

  componentWillUnmount() {
    console.log('genetic test form unmounting')
    debugger
  }

  handleChange(value) {
    this.setState({
      timeAgoAmount: value.timeAgoAmount || this.state.timeAgoAmount,
      timeAgoUnit: value.timeAgoUnit || this.state.timeAgoUnit,
      absoluteDate: value.absoluteDate || this.state.absoluteDate,
      lab: value.lab || this.state.lab,
      labClassification: value.labClassification || this.state.labClassification,
      clinicalClassification: value.clinicalClassification || this.state.clinicalClassification,
      predictiveTestingRecommended: value.predictiveTestingRecommended || this.state.predictiveTestingRecommended,
      transcript: value.transcript || this.state.transcript,
      protein: value.protein || this.state.protein,
      variant: value.variant || this.state.variant,
      exons: value.exons || this.state.exons,
      file: value.file || this.state.file,
      note: value.note || this.state.note,
    });
  }

  render() {
    const parameterizedPlural = 'genetic_tests';
    const classifications = [
      'pathogenic',
      'likely pathogenic',
      'VUS likely disease-causing',
      'VUS',
      'VUS likely benign',
      'likely benign',
      'benign',
      'consistent with clinical diagnosis'
    ];

    const locations = [
      'Ambry',
      'Collagen Diagnostic Laboratory',
      'Connective Tissue Gene Tests',
      'GeneDX',
      'Invitae',
      'Laboratory for Molecular Medicine',
      'Matrix',
      'Tulane'
    ];
    return (
      <tr className="row_form" id={'row_' + this.props.rowID}>
        <td colSpan={3}>
          <HiddenFields
            visit={this.props.visit}
            topic={this.props.topic}
            parameterizedPlural={parameterizedPlural}
            rowID={this.props.rowID}
          />
          <div className="form-group row no-gutters">
            <div className="col-sm-3">
              Lab
              <SelectConstructor
                arr={locations}
                title="lab name"
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
                name="labName"
                value={this.state.labName}
                onUnitChange={this.handleChange}
              />
            </div>
            <div className="col-sm-3">
              Lab Classification
              <SelectConstructor
                arr={classifications}
                title="lab classification"
                parameterizedPlural={parameterizedPlural}
                name="labClassification"
                rowID={this.props.rowID}
                value={this.state.labClassification}
                onUnitChange={this.handleChange}
              />
            </div>
            <div className="col-sm-3">
              Clinical Classification
              <SelectConstructor
                arr={classifications}
                title="clinical classification"
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
                name="clinicalClassification"
                value={this.state.clinicalClassification}
                onUnitChange={this.handleChange}
              />
            </div>
            <div className="col-sm-3">
              <div className="form-check">
                <label className="form-check-label">
                  <input
                    type="checkbox"
                    value={this.state.predictiveTestingRecommended}
                    name="predictiveTestingRecommended"
                    id={'visit_genetic_tests_attributes_' + this.props.rowID + '_predictive_testing_recommended'}
                    className="form-check-input"
                  />
                  Recommend predictive testing
                </label>
              </div>
            </div>
          </div>
          <div className="form-group row no-gutters">
            <div className="col-sm-4">
              Transcript
              <div className="input-group">
                <span className="input-group-addon" id={'transcript_' + this.props.rowID}>
                  NM_
                </span>
                <input
                  type="string"
                  placeholder="000138.4"
                  name="transcript"
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_transcript'}
                  className="form-control"
                  value={this.state.transcript}
                  aria-describedby={'transcript_' + this.props.rowID}
                />
              </div>
            </div>
            <div className="col-sm-4">
              Protein
              <div className="input-group">
                <span
                  className="input-group-addon"
                  id={'protein_' + this.props.rowID}
                >
                  p.
                </span>
                <input
                  type="string"
                  placeholder="Gly931fsX10"
                  name="protein"
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_protein'}
                  className="form-control"
                  value={this.state.protein}
                  aria-describedby={'protein_' + this.props.rowID}
                />
              </div>
            </div>
            <div className="col-sm-3">
              Variant
              <div className="input-group">
                <span
                  className="input-group-addon"
                  id={'variant_' + this.props.rowID}
                >
                  c.
                </span>
                <input
                  type="string"
                  placeholder="2793delG"
                  name="variant"
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_variant'}
                  className="form-control"
                  value={this.state.variant}
                  aria-describedby={'variant_' + this.props.rowID}
                />
              </div>
            </div>
            <div className="col-sm-1">
              Exons
              <input
                type="number"
                placeholder="23"
                min="1"
                max="63"
                name="exons"
                id={'visit_' + parameterizedPlural + '_attributes_' + this.propsrowID + '_exons'}
                className="form-control"
                value={this.state.exons}
              />
            </div>
          </div>
          <div className="row no-gutters">
            <div className="form-inline col-sm-8">
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
            <div className="form-inline col-sm-4">
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
        </td>
      </tr>
    );
  }
}

AssembledGeneticTestForm.propTypes = {
  topic: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired
};
