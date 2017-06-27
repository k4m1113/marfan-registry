import nestedListPane from './nestedListPane';
import epicAddForm from './epicAddForm';
import familyTree from './panes/familyTree';
import vitals from './panes/vitals';
import aorticImaging from './panes/aorticImaging'

function keyify(str) {
  [' ', '/'].forEach(function (x) {
    str = str.replace(x, '_')
  });
  ['(', ')'].forEach(function (y) {
    str = str.replace(y, '')
  });
  return str
}

module.exports = function nestedList(allTopics, visit) {
  let topBar = `<ul class="nav nav-tabs flex-column" role="tablist">`
  for (let i = 0; i < allTopics.length; i++) {
    let groupName = allTopics[i][0]
    let key = keyify(groupName)
    topBar += `<h6 class=""><li class="nav-item" style="width:60px;">
      <a class="nav-link open-tab" data-tab-index="${i}" data-toggle="tab" href="#${key}" role="tab">
        ${groupName}
      </a>
    </li>
    </h6>`
  }
  topBar += '</ul>'

  let panes = `<div class="tab-content">`
  for (var i = 0; i < allTopics.length; i++) {
    const groupName = allTopics[i][0]
    const topics = allTopics[i][1]
    const key = keyify(groupName)
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
        panes += `${vitals(topics, visit)}</div>`
        break;
      case 'cardiovascular':
        panes += `${nestedListPane(topics, visit)}</div>`
        break;
      case 'aortic imaging':
        panes += `${aorticImaging(topics, visit)}</div>`
        break;
      case 'medication':
        panes += `${epicAddForm()}`
        panes += `${nestedListPane(topics, visit)}</div>`
        break;
      default:
        panes += `${nestedListPane(topics, visit)}</div>`

    }
  }
  panes += `</div>`
  const returnStatement = `${topBar}
  ${panes}`
  return returnStatement
}
