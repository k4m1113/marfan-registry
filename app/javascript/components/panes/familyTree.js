import assembledFamilyMemberForm from '../row_form_pieces/assembledFamilyMemberForm'
import familyTreeBody from '../row_form_pieces/familyTreeBody'
import familyUnit from '../row_form_pieces/familyUnit'

export default {
  familyTree(patient, visit, unsortedTopics, sortedConcerns) {
    const date = new Date(patient.date_of_birth)
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    const date_str = `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`
    const childTopic = unsortedTopics.find(obj => obj.name === 'child')
    const parentTopic = unsortedTopics.find(obj => obj.name === 'parent')
    const family = familyUnit(unsortedTopics, sortedConcerns, childTopic, parentTopic)
    const returnStatement = `<table class="family-tree">
      <tr>
        <td width="30%" class="person_name child">
          ${familyTreeBody(family.children[0], childTopic, 'name', 1, patient, visit)}
        </td>
        <td rowspan="2" class="person_name" width="30%">
          ${patient.first_name} ${patient.last_name}
        </td>
        <td width="30%" class="person_name parent" id="parent_1_name">
          ${familyTreeBody(family.parents[0], parentTopic, 'name', 1, patient, visit)}
        </td>
      </tr>
      <tr>
        <td class="lifespan rightborder child" id="child_2_lifespan">
          ${familyTreeBody(family.children[1], childTopic, 'details', 2, patient, visit)}
        </td>
        <td class="lifespan leftborder parent" id="parent_1_lifespan">
          ${familyTreeBody(family.parents[0], parentTopic, 'details', 1, patient, visit)}
        </td>
      </tr>
      <tr>
        <td class="person_name rightborder child" id="child_2_name">
          ${familyTreeBody(family.children[1], childTopic, 'name', 2, patient, visit)}
        </td>
        <td rowspan="2" class="lifespan">
          ${date_str}
          <br />
          ${patient.city}, ${patient.state}
        </td>
        <td class="person_name leftborder parent" id="parent_2_name">
          ${familyTreeBody(family.parents[1], parentTopic, 'name', 2, patient, visit)}
        </td>
      </tr>
      <tr>
        <td class="lifespan" id="child_2_lifespan">
          ${familyTreeBody(family.children[1], childTopic, 'details', 2, patient, visit)}
        </td>
        <td class="lifespan parent" id="parent_2_lifespan">
          ${familyTreeBody(family.parents[1], parentTopic, 'details', 2, patient, visit)}
        </td>
      </tr>
    </table>`;
    return returnStatement;
  }
}
