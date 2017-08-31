import React from 'react';
import ReactDOM from 'react-dom'
import rowForm from './row_form_pieces/rowForm';
import keyify from './keyify';

export default class NestedListPane extends React.Component {
  render() {
    const { topicsByType, unsortedTopics, visit, paneKey } = this.props
    let topicTypeKey
    let typeKey
    const topicButtons = topicsByType.map(tg =>
      <button className="paneTopicGroup btn btn-secondary" data-target={paneKey + "_" + keyify(tg)} type="button">
        {tg}
      </button>
    )
    let topicGroups = topicsByType.map(topicGroup =>
      <div id={paneKey + "_" + keyify(topicGroup)} class="tabbable">
        <table class="table table-sm">
          <thead>
            <tr>
              <th>
                <h6 class="btn btn-sm all-neg-toggler">
                  All Absent
                </h6>
              </th>
              <th>
                Present
              </th>
              <th>
                Absent
              </th>
            </tr>
          </thead>
          <tbody>
          topicsByType[topicGroup].map(i =>
            topicGroups.push(
              rowForm(topicsByType[topicGroup][i], unsortedTopics, visit)
            )
          )
          </tbody>
        </table>
      </div>
    )
    return (
      <div>
        <div className="topicButtons btn-group" role="group">
          {topicButtons}
        </div>
        {topicGroups}
      </div>
    )
  }
}
