import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import NestedListPane from './NestedListPane';
import EpicAddForm from './EpicAddForm';
import AorticImaging from './panes/AorticImaging';
import FamilyTree from './panes/FamilyTree';
import Vitals from './panes/Vitals';

export default class TabPane extends Component {
  render() {
    const firstPanel = (this.props.i === 0 ? 'show in' : '');
    let pane;
    switch (this.props.groupName) {
      case 'family history':
        pane = (
          <FamilyTree
            patient={this.props.patient}
            visit={this.props.visit}
            unsortedTopics={this.props.unsortedTopics}
            sortedConcerns={this.props.sortedConcerns}
          />
        );
        break;
      case 'vitals':
        pane = (
          <Vitals
            topics={this.props.topicsByType.vital}
            visit={this.props.visit}
          />
        )
        break;
      case 'aortic imaging':
        pane = (
          <AorticImaging
            topics={this.props.topicsByType.heart_measurement}
            visit={this.props.visit}
          />
        )
        break;
      case 'medication':
        pane = (
          <div>
            <EpicAddForm />
            <NestedListPane
              topicsByType={this.props.topicsByType}
              unsortedTopics={this.props.unsortedTopics}
              visit={this.props.visit}
              paneKey={this.props.dataKey}
              />
          </div>
        );
        break;
      default:
        pane = (
          <NestedListPane
            topicsByType={this.props.topicsByType}
            unsortedTopics={this.props.unsortedTopics}
            visit={this.props.visit}
            paneKey={this.props.dataKey}
          />
        );
    }
    return (
      <div
        id={this.props.dataKey}
      >
        {pane}
      </div>
    );
  }
}

TabPane.propTypes = {
  i: PropTypes.number.isRequired,
  dataKey: PropTypes.string.isRequired,
  groupName: PropTypes.string.isRequired,
  topicsByType: PropTypes.object.isRequired,
  patient: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
  sortedConcerns: PropTypes.object.isRequired,
};
