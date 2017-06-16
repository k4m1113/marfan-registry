module.exports = function renderFamilyTree(patient) {
  // console.log(patient)
  const date = new Date(patient.date_of_birth)
  const months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
  const date_str = `${date.getDate()} ${months[date.getMonth()]} ${date.getFullYear()}`

  const returnStatement = `<table class="family-tree">
    <tr>
      <td width="30%" class="person_name">
        CHILD 1 NAME
      </td>
      <td rowspan="2" class="person_name" width="30%">
        ${patient.first_name} ${patient.last_name}
      </td>
      <td width="30%" class="person_name">
        PARENT 1 NAME
      </td>
    </tr>
    <tr>
      <td class="date rightborder">
        CHILD 1 LIFESPAN
        <br />
        CHILD 1 LOCATION
      </td>
      <td class="date leftborder">
        PARENT 1 LIFESPAN
        <br />
        PARENT 1 LOCATION
      </td>
    </tr>
    <tr>
      <td class="person_name rightborder">
        CHILD 2 NAME
      </td>
      <td rowspan="2" class="date">
        ${date_str}
        <br />
        ${patient.city}, ${patient.state}
      </td>
      <td class="person_name leftborder">
        PARENT 2 NAME
      </td>
    </tr>
    <tr>
      <td class="date">
        CHILD 2 LIFESPAN
        <br />
        CHILD 2 LOCATION
      </td>
      <td class="date">
        PARENT 2 LIFESPAN
        <br />
        PARENT 2 LOCATION
      </td>
    </tr>
  </table>`;
  return returnStatement;
};
