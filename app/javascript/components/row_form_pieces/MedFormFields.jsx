import React, { Component } from 'react';
import PropTypes from 'prop-types';
import $ from 'jquery';
import SelectConstructor from './SelectConstructor'
import FrequencyField from './FrequencyField'
import TimeAgoField from './TimeAgoField'
import DurationField from './DurationField'
import NoteField from './NoteField'
import addKeyboard from '../addKeyboard'
require('../addKeyboard');
require('jquery-ujs');
require('jquery-ui/ui/core.js');
require('jquery-ui/ui/position');

const ingestionMethods = ['orally', 'intravenously', 'intramuscularly', 'subcutaneously', 'sublingually', 'buccally', 'rectally', 'vaginally', 'by the ocular route', 'by the otic route', 'nasally', 'by nebulization', 'cutaneously', 'transdermally', 'intrathecally'];
const unitsOfMeas = ['mcg', 'mg', 'mL', 'mm', 'g', 'L', 'IU'];
const dosageForms = ['tablet', 'capsule', 'pill', 'liquid solution', 'inhaler', 'cream', 'drops', 'suppository'];

export default class MedFormFields extends Component {
  constructor() {
    super();
    this.state = {
      measurement: null,
      units: null,
      timeAgoAmount: null,
      timeAgoUnit: null,
      absoluteDate: null,
      dose: null,
      doseUnitOfMeasurement: null,
      dosageForm: null,
      dosageFormUnits: null,
      ingestionMethod: null,
      durationAmount: null,
      durationUnit: null,
      keywords: null,
      note: null,
      file: null,
    };
    this.keyboardize0 = this.keyboardize0.bind(this);
    this.keyboardize1 = this.keyboardize1.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  componentDidMount() {
    this.$el0 = $(this.el0);
    this.$el1 = $(this.el1);
    this.$el0.addKeyboard();
    this.$el1.addKeyboard();
  }

  componentWillUnmount() {
    this.$el0.addKeyboard('destroy');
    this.$el1.addKeyboard('destroy');
  }

  keyboardize0(e) {
    e.preventDefault();
    this.$el0 = $(this.el0);
    const kb = this.$el0.getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if (kb.isOpen) {
      kb.close();
    } else {
      kb.reveal();
    }
  }

  keyboardize1(e) {
    e.preventDefault();
    this.$el1 = $(this.el1);
    const kb = this.$el1.getkeyboard();
    // close the keyboard if the keyboard is visible and the button is clicked a second time
    if (kb.isOpen) {
      kb.close();
    } else {
      kb.reveal();
    }
  }

  handleChange(event) {
    this.props.onMedFormChange({
      [event.target.name]: event.target.value,
    })
  }

  render() {
    const parameterizedPlural = 'medications'
    return (
      <div>
        <div className="form-group row">
          <label className="col-2 col-form-label">Dose</label>
          <div className="form-inline col-10">
            <input
              type='number'
              id={'visit_medications_attributes_' + this.props.rowID + '_dose'}
              className='form-control calculator'
              placeholder='dose'
              ref={el0 => this.el0 = el0}
              name="dose"
              value={this.state.dose}
              onChange={this.handleChange}
            />
            <span className='input-group-btn'>
              <button
                className='btn btn-light calculator'
                type='button'
                id={'medications_' + this.props.rowID + '_dose_calc_button'}
                onClick={this.keyboardize0}
              >
                <i className='fa fa-calculator'></i>
              </button>
            </span>
            <SelectConstructor
              arr={unitsOfMeas}
              title="dose units"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="doseUnitOfMeasurement"
              value={this.state.doseUnitOfMeasurement}
              onUnitChange={this.handleChange}
            />
          </div>
        </div>

        <div className="form-group row">
          <label className="col-2 col-form-label">Dosage Form</label>
          <div className="form-inline col-10">
            <input
              type='number'
              id={'visit_medications_attributes_' + this.props.rowID + '_dosage_form_units'}
              className='form-control calculator'
              placeholder='dosage form units'
              ref={el1 => this.el1 = el1}
              name="dosageFormUnits"
              value={this.state.dosageFormUnits}
              onChange={this.handleChange}
            />
            <button
              className='btn btn-light calculator'
              type='button'
              id={'medications_' + this.props.rowID + '_dose_units_calc_button'}
              onClick={this.keyboardize1}
            >
              <i className='fa fa-calculator'></i>
            </button>
            <SelectConstructor
              arr={unitsOfMeas}
              title="dose form units"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="dosageFormUnits"
              value={this.state.dosageFormUnits}
              onUnitChange={this.handleChange}
            />
            <SelectConstructor
              arr={dosageForms}
              title="dose form"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="dosageForm"
              value={this.state.dosageForm}
              onUnitChange={this.handleChange}
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
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
              name="ingestionMethod"
              value={this.state.ingestionMethod}
              onUnitChange={this.handleChange}
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
              durationAmount={this.state.durationAmount}
              durationUnit={this.state.durationUnit}
              onDurationChange={this.handleChange}
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
              frequencyAmount={this.state.frequencyAmount}
              frequencyUnit={this.state.frequencyUnit}
              onFrequencyChange={this.handleChange}
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
