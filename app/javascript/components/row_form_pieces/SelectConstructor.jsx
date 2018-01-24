import React, { Component } from 'react';
import PropTypes from 'prop-types';

export default class SelectConstructor extends Component {
  constructor(props) {
    super(props);
    this.state = {
      units: null,
    }
    this.handleChange = this.handleChange.bind(this)
  }

  handleChange(event) {
    this.props.onUnitChange(event);
  }

  render() {
    let inputBegin
    if (this.props.arr.length === 1) {
      if (this.props.multiSelect) {
        inputBegin = (
          <input
            type="text"
            disabled="true"
            name={this.props.name}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.name}
            className="form-control single-option"
            value={this.state.units}
            multiple
            onChange={this.handleChange}
          />
        );
      } else {
        inputBegin = (
          <input
            type="text"
            disabled="true"
            name={this.props.name}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control single-option"
            value={this.props.arr[0]}
          />
        );
      }
    } else {
      let options = [];
      if (this.props.arr.length >= 2) {
        options.push(
          <option value="" selected disabled default key={this.props.title}>
            {this.props.title}
          </option>
        );
      }
      this.props.arr.map(item =>
        options.push(
          <option value={item} key={this.props.title + '_' + item}>
            {item}
          </option>,
        ),
      );
      if (this.props.other) {
        options.push(
          <option className="select-other" key={this.props.title + '_other'}>
            other (please specify)
          </option>,
        );
      }
      if (this.props.multiSelect) {
        inputBegin = (
          <select
            name={this.props.name}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control"
            multiple
            onChange={this.handleChange}
          >
            {options}
          </select>
        );
      } else {
        inputBegin = (
          <select
            name={this.props.name}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control"
            onChange={this.handleChange}
          >
            {options}
          </select>
        );
      }
    }
    return (
      <div>
        {inputBegin}
      </div>
    );
  }
}

SelectConstructor.defaultProps = {
  multiSelect: false,
  other: false,
};

SelectConstructor.propTypes = {
  arr: PropTypes.array.isRequired,
  title: PropTypes.string.isRequired,
  other: PropTypes.bool.isRequired,
  attribute: PropTypes.string.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
  multiSelect: PropTypes.bool.isRequired,
};
