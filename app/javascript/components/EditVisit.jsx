import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import NestedList from './NestedList';
import VisitHeader from './VisitHeader';

export default class EditVisit extends Component {
  render() {

    return (
      <form
        className="edit_visit"
        id={'edit_visit_' + this.props.visit.id}
        encType="multipart/form-data"
        action={'/visits/' + this.props.visit.id}
        acceptCharset="UTF-8"
        data-remote="true"
        method="post"
      >
        <input name="utf8" type="hidden" value="✓" />
        <input type="hidden" name="_method" value="patch" />
        <VisitHeader
          patient={this.props.patient}
        />
        <input type="hidden" value={this.props.visit.patient_id} name="visit[patient_attributes][id]" id="visit_patient_attributes_id" />
        <div id="reasonsForVisitHeader"></div>
        <div className="summary-accordion">
          <div id="barsAccordion" role="tablist" aria-multiselectable="true">
            <ul className="summary-bar list-unstyled" />
          </div>
        </div>
        <NestedList
          allTopics={this.props.allTopics}
          unsortedTopics={this.props.unsortedTopics}
          visit={this.props.visit}
          mskey={this.props.mskey}
          mshmac={this.props.mshmac}
          sortedConcerns={this.props.sortedConcerns}
          patient={this.props.patient}
        />
      </form>
    );
  }
}

EditVisit.propTypes = {
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
  const unsortedTopics = JSON.parse(document.getElementById('unsortedtopics').getAttribute('data-unsorted'))
  const visit = JSON.parse(document.getElementById('visit').getAttribute('data'))
  const mskey = document.getElementById('mskey').getAttribute('data')
  const mshmac = document.getElementById('mshmac').getAttribute('data')
  const sortedConcerns = JSON.parse(document.getElementById('sortedconcerns').getAttribute('data'))
  ReactDOM.render(
    <EditVisit
      allTopics={allTopics}
      unsortedTopics={unsortedTopics}
      visit={visit}
      mskey={mskey}
      mshmac={mshmac}
      sortedConcerns={sortedConcerns}
      patient={patient}
    />,
    document.getElementById('nestedListHook'),
  )
})
