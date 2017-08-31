import React from 'react';
import ReactDOM from 'react-dom';
import keyify from './keyify'

export default class Topbar extends React.Component {
  render() {
    const allTopics = this.props.allTopics
    const topics = []
    for (let i = 0; i < allTopics.length; i++) {
      const group = allTopics[i][0]
      const k = keyify(group)
      allTopics.push(
        <h6>
          <li className="nav-item" style="width:60px;">
            <a className="nav-link open-tab" data-tab-index={i} data-toggle="tab" href="#${k}" role="tab">
              {group}
            </a>
          </li>
        </h6>
      )
    }
    return (
      <ul className="nav nav-tabs flex-column" role="tablist">
        {topics}
      </ul>
    )
  }
}
