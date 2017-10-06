import React from 'react';
import PropTypes from 'prop-types';
import FamilyTreeBody from '../row_form_pieces/FamilyTreeBody';
import familyUnit from '../row_form_pieces/familyUnit';
import months from '../months'

export default class FamilyTree extends React.Component {
  render() {
    const date = new Date(this.props.patient.date_of_birth);
    const dateStr = `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`;
    const childTopic = this.props.unsortedTopics.find(obj => obj.name === 'child');
    const parentTopic = this.props.unsortedTopics.find(obj => obj.name === 'parent');
    const family = familyUnit(
      this.props.unsortedTopics,
      this.props.sortedConcerns,
      childTopic,
      parentTopic
    );
    const emptyPerson = {
      future_patient_data_hash: {
        first_name: ''
      },
      note: ''
    }

    return (
      <div>
        <table className="family-tree">
          <tbody>
            <tr>
              <td width="30%" className="person_name child">
                <FamilyTreeBody
                  person={family.children[0] ? family.children[0] : emptyPerson}
                  topic={childTopic}
                  field={'name'}
                  index={1}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
              <td rowSpan="2" className="person_name" width="30%">
                {this.props.patient.first_name} {this.props.patient.last_name}
              </td>
              <td width="30%" className="person_name parent" id="parent_1_name">
                <FamilyTreeBody
                  person={family.parents[0] ? family.parents[0] : emptyPerson}
                  topic={parentTopic}
                  field={'name'}
                  index={1}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
            </tr>
            <tr>
              <td className="lifespan rightborder child" id="child_2_lifespan">
                <FamilyTreeBody
                  person={family.children[1] ? family.children[1] : emptyPerson}
                  topic={childTopic}
                  field={'details'}
                  index={2}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
              <td className="lifespan leftborder parent" id="parent_1_lifespan">
                <FamilyTreeBody
                  person={family.parents[0] ? family.parents[0] : emptyPerson}
                  topic={parentTopic}
                  field={'details'}
                  index={1}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
            </tr>
            <tr>
              <td className="person_name rightborder child" id="child_2_name">
                <FamilyTreeBody
                  person={family.children[1] ? family.children[1] : emptyPerson}
                  topic={childTopic}
                  field={'name'}
                  index={2}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
              <td rowSpan="2" className="lifespan">
                {dateStr}
                <br />
                {this.props.patient.city}, {this.props.patient.state}
              </td>
              <td className="person_name leftborder parent" id="parent_2_name">
                <FamilyTreeBody
                  person={family.parents[1] ? family.parents[1] : emptyPerson}
                  topic={parentTopic}
                  field={'name'}
                  index={2}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
            </tr>
            <tr>
              <td className="lifespan" id="child_2_lifespan">
                <FamilyTreeBody
                  person={family.children[1] ? family.children[1] : emptyPerson}
                  topic={childTopic}
                  field={'details'}
                  index={2}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
              <td className="lifespan parent" id="parent_2_lifespan">
                <FamilyTreeBody
                  person={family.parents[1] ? family.parents[1] : emptyPerson}
                  topic={parentTopic}
                  field={'details'}
                  index={2}
                  patient={this.props.patient}
                  visit={this.props.visit}
                />
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    );
  }
}

FamilyTree.propTypes = {
  patient: PropTypes.object.isRequired,
  visit: PropTypes.object.isRequired,
  unsortedTopics: PropTypes.array.isRequired,
  sortedConcerns: PropTypes.object.isRequired,
};
