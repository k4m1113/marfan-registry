import React from 'react';
import PropTypes from 'prop-types';

export default class FindRelated extends React.Component {
  render() {
    const topic = this.props.topic
    let nextStep;
    let buttons;
    if (topic.related.length > 0) {
      nextStep = topic.related.map(ind => this.props.unsortedTopics.find(obj => obj.id === ind))
      buttons = nextStep.map(s => (
        <button
          type="button"
          className="btn btn-secondary related" data-topic={JSON.stringify(s)}
          key={s.name + 'related'}
        >
          {s.name + ' '}
          <i className="fa fa-plus" aria-hidden="true" />
        </button>
      ),
      );
    }
    return (
      <div aria-label="RELATED">
        <hr />
        <div className="form-group row">
          <label className="col-2 col-form-label">
            Related:
          </label>
          <div className="col-10">
            {buttons}
          </div>
        </div>
      </div>
    );
  }
}

FindRelated.propTypes = {
  topic: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
};
