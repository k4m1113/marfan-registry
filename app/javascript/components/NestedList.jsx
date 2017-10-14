import React from 'react';
import PropTypes from 'prop-types';
import TopBar from './TopBar';
import TabPane from './TabPane';
import { Tab, Tabs, TabList, TabPanel } from 'react-tabs';
import keyify from './keyify';

export default class NestedList extends React.Component {
  render() {
    const topics = this.props.allTopics.map((topic, i) => (
      <Tab
        key={topic[0]}
        className="bodyGroup"
      >
        {topic[0]}
      </Tab>
    ));
    const panes = this.props.allTopics.map((top, i) => (
      <TabPanel key={top[0] +'PaneButton'} className="tab-content">
        <TabPane
          i={i}
          key={(i * 100) + keyify(top[0])}
          dataKey={keyify(top[0])}
          groupName={top[0]}
          topicsByType={top[1]}
          patient={this.props.patient}
          visit={this.props.visit}
          unsortedTopics={this.props.unsortedTopics}
          sortedConcerns={this.props.sortedConcerns}
        />
      </TabPanel>
    ),
    );
    return (
      <Tabs>
        <TabList className="allGroups">
          {topics}
        </TabList>
        {panes}
      </Tabs>
    )
  }
}

NestedList.propTypes = {
  allTopics: PropTypes.array.isRequired,
  mskey: PropTypes.string.isRequired,
  mshmac: PropTypes.string.isRequired,
  patient: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
  sortedConcerns: PropTypes.object.isRequired,
};
