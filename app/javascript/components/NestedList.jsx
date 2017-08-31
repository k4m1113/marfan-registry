import React from 'react';
import ReactDOM from 'react-dom';
import TopBar from './TopBar';
import TabPane from './TabPane';
import NestedListPane from './NestedListPane';
import epicAddForm from './epicAddForm';
import familyTree from './panes/familyTree';
import vitals from './panes/vitals';
import aorticImaging from './panes/aorticImaging';
import keyify from './keyify';

export default class NestedList extends React.Component {
  render() {
    const { allTopics, unsortedTopics, visit, mskey, mshmac, sortedConcerns, topicsByType, patient } = this.props
    let panes = []
    for (let i = 0; i < allTopics.length; i++) {
      const groupName = allTopics[i][0];
      const topicsByType = allTopics[i][1];
      debugger
      const key = keyify(groupName);
      panes.push(
        <TabPane i={i}
                 key={key}
                 groupName={groupName}
                 topicsByType={topicsByType}
                 patient={patient}
                 visit={visit}
                 unsortedTopics={unsortedTopics}
                 sortedConcerns={sortedConcerns}>
        </TabPane>
      )
      const topBar = <TopBar allTopics={allTopics}></TopBar>
      return (
        <div>
          {topBar}
          <div className="tab-content">
            {panes}
          </div>
        </div>
      )
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const patient = JSON.parse(document.getElementById('patientinfo').getAttribute('data'))
  const allTopics = JSON.parse(document.getElementById('alltopics').getAttribute('data'))
  const unsortedTopics = JSON.parse(document.getElementById('unsortedtopics').getAttribute('data'))
  const visit = JSON.parse(document.getElementById('visit').getAttribute('data'))
  const mskey = document.getElementById('mskey').getAttribute('data')
  const mshmac = document.getElementById('mshmac').getAttribute('data')
  const sortedConcerns = JSON.parse(document.getElementById('sortedconcerns').getAttribute('data'))
  ReactDOM.render(
    <NestedList allTopics={allTopics}
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
