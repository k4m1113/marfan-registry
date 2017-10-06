import React from 'react';
import PropTypes from 'prop-types';

export default class Keywords extends React.Component {
  render() {
    let descriptors;
    if (this.props.topic.descriptors) {
      descriptors = this.props.topic.descriptors.map(descriptor =>
        (
          <label key={descriptor + '_' + this.props.rowID} className="form-check-label descriptor">
            <input
              className="form-check-input"
              type="checkbox"
              name={'visit[' + this.props.parameterizedPlural + '_attributes][' + this.props.rowID + '][descriptors][]'}
              id={'visit_' + this.props.parameterizedPlural + '_attributes_' + this.props.rowID + '_descriptors_' + descriptor}
              value={descriptor}
            />
            {descriptor}
          </label>
        ),
      );
    }
    return (
      <div className="form-inline descriptors">
        {descriptors}
      </div>
    );
  }
}

Keywords.propTypes = {
  topic: PropTypes.object.isRequired,
  parameterizedPlural: PropTypes.string.isRequired,
  rowID: PropTypes.number.isRequired,
};
