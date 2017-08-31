import React from 'react';
import ReactDOM from 'react-dom';
import NestedListPane from './NestedListPane'

export default class TabPane extends React.Component {
  render() {
    const { i, key, groupName, topicsByType, patient, visit, unsortedTopics, sortedConcerns } = this.props
    const firstPanel = (i == 0 ? "show in" : "")
    let pane
    switch (groupName) {
      case 'family history':
        pane = familyTree(patient, visit, unsortedTopics, sortedConcerns)
        break;
      case 'vitals':
        pane = vitals(topicsByType.vital, visit)
        break;
      case 'aortic imaging':
        pane = aorticImaging(topicsByType.heart_measurement, visit)
        break;
      case 'medication':
        // const pane = epicAddForm()
        pane =
          <NestedListPane topicsByType={topicsByType}
                          unsortedTopics={unsortedTopics}
                          visit={visit}
                          key={key}>
          </NestedListPane>
        break;
      default:
        pane =
          <NestedListPane topicsByType={topicsByType}
                          unsortedTopics={unsortedTopics}
                          visit={visit}
                          key={key}>
          </NestedListPane>
    }
    return(
      <div className="tab-pane fade {firstPanel}" role="tabpanel" id={key} data-tab-index={i}>
        {pane}
      </div>
    )
  }
}
