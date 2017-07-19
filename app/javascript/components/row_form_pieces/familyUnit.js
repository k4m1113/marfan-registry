module.exports = function familyUnit(unsortedTopics, sortedConcerns, childTopic, parentTopic) {
  let children = []
  let parents = []
  let other = []
  if (Object.keys(sortedConcerns['family history']).length > 0) {
    const family = sortedConcerns['family history'].FamilyMembers
    for (let i = 0; i < family.length; i++) {
      if (family[i].topic_id === childTopic.id) {
        children.push(family[i])
      } else if (family[i].topic_id === parentTopic.id) {
        parents.push(family[i])
      } else {
        other.push(family[i])
      }
    }
    while (children.length < 2) {
      children.push(null)
    }
    while (parents.length < 2) {
      parents.push(null)
    }
  }
  return { parents: parents, children: children }
}
