import nestedListPane from './nestedListPane';
import epicAddForm from './epicAddForm';
import familyTree from './panes/familyTree';
import vitals from './panes/vitals';
import aorticImaging from './panes/aorticImaging'
import keyify from './keyify'

module.exports = function nestedList(allTopics, unsortedTopics, visit) {
  let topBar = `<ul class="nav nav-tabs flex-column" role="tablist">`
  for (let i = 0; i < allTopics.length; i++) {
    const group = allTopics[i][0]
    const k = keyify(group)
    topBar += `<h6 class=""><li class="nav-item" style="width:60px;">
      <a class="nav-link open-tab" data-tab-index="${i}" data-toggle="tab" href="#${k}" role="tab">
        ${group}
      </a>
    </li>
    </h6>`
  }
  topBar += '</ul>'

  let panes =   '<div class="tab-content">'
  for (let i = 0; i < allTopics.length; i++) {
    const groupName = allTopics[i][0];
    const topicsByType = allTopics[i][1];
    const key = keyify(groupName);
    if (i == 0) {
      panes += `<div class="tab-pane fade show in" role="tabpanel" id="${key}" data-tab-index="${i}">`
    }
    else {
      panes += `<div class="tab-pane fade" role="tabpanel" id="${key}" data-tab-index="${i}">`
    }
    switch (groupName) {
      case 'family history':
        panes += `${familyTree(patient)}</div>`
        break;
      case 'vitals':
        panes += `${vitals(topicsByType.stat, visit)}</div>`
        break;
      case 'cardiovascular':
        panes += `${nestedListPane(topicsByType, unsortedTopics, visit, key)}</div>`
        break;
      case 'aortic imaging':
        panes += `${aorticImaging(topicsByType.heart_measurement, visit)}</div>`
        break;
      case 'medication':
        panes += `${epicAddForm()}`
        panes += `${nestedListPane(topicsByType.medication, unsortedTopics, visit, key)}</div>`
        break;
      default:
        panes += `${nestedListPane(topicsByType, unsortedTopics, visit, key)}</div>`

    }
  }
  panes += `</div>`
  const returnStatement = `${topBar}
  ${panes}`
  return returnStatement
}
