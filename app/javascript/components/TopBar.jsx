import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import keyify from './keyify';

export default class TopBar extends React.Component {
  render() {
    const allTopics = this.props.allTopics
    const topics = allTopics.map((topic, i) => (
      <h6 key={i}>
        <li className="nav-item" style={{ width: '60px' }}>
          <a className="nav-link open-tab" data-tab-index={i} data-toggle="tab" href={'#' + keyify(topic[0])} role="tab">
            {topic[0]}
          </a>
        </li>
      </h6>
    ));
    return (
      <ul className="nav nav-tabs flex-column" role="tablist">
        {topics}
      </ul>
    );
  }
}

TopBar.propTypes = {
  allTopics: PropTypes.array.isRequired,
}
