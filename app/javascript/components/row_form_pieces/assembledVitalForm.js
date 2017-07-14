import hiddenFields from './hiddenFields'
import measurementField from './measurementField'

module.exports = function assembledVitalForm(topic, visit, rowID = topic.id) {
  let returnStatement = ``
  const parameterizedPlural = 'vitals'
  returnStatement += `<div class="form-group row">
      <label class="col-2 col-form-label">${topic.name}</label>
      <div class="form-inline col-10">
        ${hiddenFields(visit, topic, parameterizedPlural, rowID)}
        ${measurementField(topic, parameterizedPlural, null, topic.name, rowID)}
      </div>
    </div>`

  return returnStatement
}
