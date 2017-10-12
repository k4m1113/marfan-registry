import React from 'react';
import PropTypes from 'prop-types';
import FileAttachmentButton from './FileAttachmentButton';
import HiddenFields from './HiddenFields';
import NoteField from './NoteField';
import SelectConstructor from './SelectConstructor';
import TimeAgoField from './TimeAgoField';

export default class AssembledGeneticTestForm extends React.Component {
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
                name="labName"
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
              />
            </div>
            <div className="col-sm-3">
              Lab Classification
              <SelectConstructor
                arr={classifications}
                title="lab classification"
                name="labClassification"
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
              />
            </div>
            <div className="col-sm-3">
              Clinical Classification
              <SelectConstructor
                arr={classifications}
                title="clinical classification"
                name="clinicalClassification"
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
              />
            </div>
            <div className="col-sm-3">
              <div className="form-check">
                <label className="form-check-label">
                  <input
                    type="checkbox"
                    value="true"
                    name={'visit[genetic_tests_attributes][' + this.props.rowID + '][predictive_testing_recommended]'}
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
                  name={'visit[' +  parameterizedPlural + '_attributes][${rowID}][transcript]'}
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_transcript'}
                  className="form-control"
                  value=""
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
                  name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][protein]'}
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_protein'}
                  className="form-control"
                  value=""
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
                  name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][variant]'}
                  id={'visit_' + parameterizedPlural + '_attributes_' + this.props.rowID + '_variant'}
                  className="form-control"
                  value=""
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
                name={'visit[' + parameterizedPlural + '_attributes][' + this.props.rowID + '][exons]'}
                id={'visit_' + parameterizedPlural + '_attributes_' + this.propsrowID + '_exons'}
                className="form-control"
                value=""
              />
            </div>
          </div>
          <div className="row no-gutters">
            <div className="form-inline col-sm-8">
              <TimeAgoField
                topic={this.props.topic}
                parameterizedPlural={parameterizedPlural}
                rowID={this.props.rowID}
              />
            </div>
            <div className="form-inline col-sm-4">
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
