import nestedListPane from './nestedListPane';
import renderEpicAddForm from './epicAddForm';
import renderFamilyTree from './panes/familyTree';
import renderVitalFields from './panes/vitals';

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
  let updateButton = `<input type="submit" name="commit" value="Update Visit" class="col-centered form-control-label btn btn-secondary btn-lg" style="width:100%;">`
  let topBar = `<ul class="nav nav-tabs flex-column" role="tablist">`
  for (let i = 0; i < allTopics.length; i++) {
    let groupName = allTopics[i][0]
    let key = keyify(groupName)
    topBar += `<li class="nav-item" style="width:60px;">
      <a class="nav-link open-tab" data-tab-index="${i}" data-toggle="tab" href="#${key}" role="tab">
        ${groupName}
      </a>
    </li>`
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
    panes += `${updateButton}`
    switch (groupName) {
      case 'family history':
        panes += `${renderFamilyTree(patient)}</div>`
        break;
      case 'vitals':
        panes += `${renderVitalFields(topics, visit)}</div>`
        break;
      case 'aortic imaging':
        panes += 'AORTIC IMAGING</div>'
        break;
      case 'medication':
        panes += `${renderEpicAddForm()}`
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
