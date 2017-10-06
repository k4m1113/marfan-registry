import React from 'react';
import PropTypes from 'prop-types';

export default class SelectConstructor extends React.Component {
  render() {
    let inputBegin
    if (this.props.arr.length === 1) {
      if (this.props.multiSelect) {
        inputBegin = (
          <input
            type="text"
            disabled="true"
            name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][' + this.props.attribute + ']'}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control single-option"
            value={this.props.arr[0]}
            multiple
          />
        );
      } else {
        inputBegin = (
          <input
            type="text"
            disabled="true"
            name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][' + this.props.attribute + ']'}
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
          <option value="" default disabled key={this.props.title}>
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
            name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][' + this.props.attribute + ']'}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control"
            multiple
          >
            {options}
          </select>
        );
      } else {
        inputBegin = (
          <select
            name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][' + this.props.attribute + ']'}
            id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_' + this.props.attribute}
            className="form-control"
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
