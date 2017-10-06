import React from 'react';
import PropTypes from 'prop-types';
import SelectConstructor from './SelectConstructor'
import FrequencyField from './FrequencyField'
import TimeAgoField from './TimeAgoField'
import DurationField from './DurationField'
import NoteField from './NoteField'
import addKeyboard from '../addKeyboard'

const ingestionMethods = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally'];
const unitsOfMeas = ['mcg', 'mg', 'mL', 'mm', 'g', 'L', 'IU'];
const dosageForms = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository'];

export default class MedFormFields extends React.Component {
  render() {
    const parameterizedPlural = 'medications'
    return (
      <div>
        <div className="form-group row">
          <label className="col-2 col-form-label">Dose</label>
          <div className="form-inline col-10">
            <input
              type='number'
              name={'visit[medications_attributes][' + this.props.rowID + '][dose]'}
              id={'visit_medications_attributes_' + this.props.rowID + '_dose'}
              className='form-control calculator'
              placeholder='dose'
            />
            <span className='input-group-btn'>
              <button
                className='btn btn-secondary calculator'
                type='button'
                id={'medications_' + this.props.rowID + '_dose_calc_button'}
              >
                <i className='fa fa-calculator'></i>
              </button>
            </span>
            <SelectConstructor
              arr={unitsOfMeas}
              title="dose units"
              attribute="dose_unit_of_measurement"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">Dosage Form</label>
          <div className="form-inline col-10">
            <input
              type='number'
              name={'visit[medications_attributes][' + this.props.rowID + '][dosage_form_units]'}
              id={'visit_medications_attributes_' + this.props.rowID + '_dosage_form_units'}
              className='form-control calculator'
              placeholder='dosage form units'
            />
            <button
              className='btn btn-secondary calculator'
              type='button'
              id={'medications_' + this.props.rowID + '_dose_units_calc_button'}
            >
              <i className='fa fa-calculator'></i>
            </button>
            <SelectConstructor
              arr={unitsOfMeas}
              title="dose form units"
              attribute="dosage_form_units"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
            <SelectConstructor
              arr={dosageForms}
              title="dose form"
              attribute="dosage_form"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">
            Method of Ingestion
          </label>
          <div className="form-inline col-10">
            <SelectConstructor
              arr={ingestionMethods}
              title="MOI"
              attribute="ingestion_method"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">Duration</label>
          <div className="form-inline col-10">
            <DurationField
              topic={this.props.topic}
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">Frequency</label>
          <div className="form-inline col-10">
            <FrequencyField
              topic={this.props.topic}
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">When</label>
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
          </div>
        </div>
      </div>
    );
  }
}

MedFormFields.propTypes = {
  topic: PropTypes.object.isRequired,
  rowID: PropTypes.number.isRequired,
};
