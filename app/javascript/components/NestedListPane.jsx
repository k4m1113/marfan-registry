import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import RowForm from './row_form_pieces/RowForm';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import keyify from './keyify';

export default class NestedListPane extends Component {
  render() {
    const topicButtons = Object.keys(this.props.topicsByType).map(tg =>
      (
        <Tab
          key={this.props.paneKey + '_' + keyify(tg)}
          className="paneTopicGroup btn btn-light"
        >
          {tg}
        </Tab>
      ),
    );
    const tg = Object.entries(this.props.topicsByType)
    const topicGroups = tg.map(topicGroup => (
      <TabPanel key={this.props.paneKey + '_' + keyify(topicGroup[0])}>
        <table className="table table-sm presAbs">
          <thead>
            <tr className="presAbs">
              <th>
                <h6 className="btn btn-sm all-neg-toggler">
                  All Absent
                </h6>
              </th>
              <div className="pull-right">
                <th>
                  Present
                </th>
                <th>
                  Absent
                </th>
              </div>
            </tr>
          </thead>
          {topicGroup[1].map((topic, i) => (
            <RowForm
              rowID={topic.id}
              topic={topic}
              visit={this.props.visit}
              unsortedTopics={this.props.unsortedTopics}
              key={topicGroup[0] + '_' + this.props.paneKey + '_' + i}
            />
          ),
          )}
        </table>
      </TabPanel>
    ),
    );

    return (
      <Tabs>
        <TabList className="btn-group pull-left" role="group">
          {topicButtons}
        </TabList>
        {topicGroups}
      </Tabs>
    );
  }
}

NestedListPane.propTypes = {
  topicsByType: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
  visit: PropTypes.object.isRequired,
  paneKey: PropTypes.string.isRequired,
}
