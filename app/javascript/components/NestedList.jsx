import React from 'react';
import ReactDOM from 'react-dom';
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

document.addEventListener('DOMContentLoaded', () => {
  const patient = JSON.parse(document.getElementById('patientinfo').getAttribute('data'))
  const allTopics = JSON.parse(document.getElementById('alltopics').getAttribute('data'))
  const unsortedTopics = JSON.parse(document.getElementById('unsortedtopics').getAttribute('data'))
  const visit = JSON.parse(document.getElementById('visit').getAttribute('data'))
  const mskey = document.getElementById('mskey').getAttribute('data')
  const mshmac = document.getElementById('mshmac').getAttribute('data')
  const sortedConcerns = JSON.parse(document.getElementById('sortedconcerns').getAttribute('data'))
  ReactDOM.render(
    <NestedList
      allTopics={allTopics}
      unsortedTopics={unsortedTopics}
      visit={visit}
      mskey={mskey}
      mshmac={mshmac}
      sortedConcerns={sortedConcerns}
      patient={patient}
    />,
    document.body.appendChild(document.createElement('div')),
  )
})
