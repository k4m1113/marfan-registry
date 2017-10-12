import React from 'react';
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

export default class MedFormFields extends React.Component {
  constructor() {
    super();
    this.keyboardize0 = this.keyboardize0.bind(this)
    this.keyboardize1 = this.keyboardize1.bind(this)
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
              ref={el0 => this.el0 = el0}
            />
            <span className='input-group-btn'>
              <button
                className='btn btn-secondary calculator'
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
              name="doseUnitOfMeasurement"
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
              ref={el1 => this.el1 = el1}
            />
            <button
              className='btn btn-secondary calculator'
              type='button'
              id={'medications_' + this.props.rowID + '_dose_units_calc_button'}
              onClick={this.keyboardize1}
            >
              <i className='fa fa-calculator'></i>
            </button>
            <SelectConstructor
              arr={unitsOfMeas}
              title="dose form units"
              name="dosageFormUnits"
              parameterizedPlural={parameterizedPlural}
              rowID={this.props.rowID}
            />
            <SelectConstructor
              arr={dosageForms}
              title="dose form"
              name="dosageForm"
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
              name="ingestionMethod"
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
