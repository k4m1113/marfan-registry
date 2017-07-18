import assembledFamilyMemberForm from '../row_form_pieces/assembledFamilyMemberForm'

module.exports = function familyTree(patient) {
  const date = new Date(patient.date_of_birth)
  const months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  const date_str = `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`

  const returnStatement = `<table class="family-tree">
    <tr>
      <td width="30%" class="person_name child" data-target="#childModal" data-toggle="modal">
        CHILD 1
      </td>
      <td rowspan="2" class="person_name" width="30%">
        ${patient.first_name} ${patient.last_name}
      </td>
      <td width="30%" class="person_name parent" id="parent_1_name">
        PARENT 1 NAME
      </td>
    </tr>
    <tr>
      <td class="lifespan rightborder child" id="child_2_lifespan">
        CHILD 1 LIFESPAN
        <br />
        CHILD 1 LOCATION
      </td>
      <td class="lifespan leftborder parent" id="parent_1_lifespan">
        PARENT 1 LIFESPAN
        <br />
        PARENT 1 LOCATION
      </td>
    </tr>
    <tr>
      <td class="person_name rightborder child" id="child_2_name">
        CHILD 2 NAME
      </td>
      <td rowspan="2" class="lifespan">
        ${date_str}
        <br />
        ${patient.city}, ${patient.state}
      </td>
      <td class="person_name leftborder parent" id="parent_2_name">
        PARENT 2 NAME
      </td>
    </tr>
    <tr>
      <td class="lifespan" id="child_2_lifespan">
        CHILD 2 LIFESPAN
        <br />
        CHILD 2 LOCATION
      </td>
      <td class="lifespan parent" id="parent_2_lifespan">
        PARENT 2 LIFESPAN
        <br />
        PARENT 2 LOCATION
      </td>
    </tr>
  </table>
  <div class="modal fade" id="childModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          ${assembledFamilyMemberForm()}
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save changes</button>
        </div>
      </div>
    </div>
  </div>

  `;
  return returnStatement;
};
