import epicMeds from './epicMeds';
import medMapper from './medMapper';

module.exports = function parseMed(str, visit, allMeds) {
  let returnStatement = []
  const medsArr = str.split('•  ');
  medsArr.shift();
  const medsJSON = []
  for (let i = 0; i < medsArr.length; i++) {
    let commas = epicMeds(medsArr[i])
    commas = commas.map(x => x.trim());
    console.log(commas)
    if (commas[0].includes('(')) {
      const firstParen = commas[0].indexOf('(')
      const secondParen = commas[0].indexOf(')')
      const doseSpace = commas[1].indexOf(' ')
      const lastSpace = commas[1].indexOf(' ', doseSpace + 1)
      medsJSON.push(
        {
          name: commas[0].slice(0, firstParen - 1),
          commonName: commas[0].slice(firstParen + 1, secondParen),
          dose: commas[1].slice(0, doseSpace),
          doseUnitOfMeas: commas[1].slice(doseSpace + 1, lastSpace),
          dosageForm: commas[1].slice(lastSpace + 1, commas[0].length),
          ingestionMethod: commas[2],
          topicID: medMapper(commas[0].slice(0, firstParen - 1), commas[0].slice(firstParen + 1, secondParen), allMeds)
        }
      )
    } else {
      medsJSON.push(
        {
          medicationFormat: commas[0],
          ingestionMethod: commas[1],
          topicID: medMapper(commas[0], commas[0], allMeds)
        }
      )
    }
  }
  for (let i = 0; i < medsJSON.length; i++) {
    if (medsJSON[i].medicationFormat) {
      returnStatement.push(
        `<tr>
          <td colspan="2">
            <input value="${medsJSON[i].medicationFormat}" class="form-control" type="text" name="visit[medications_attributes][${i}][name]" id="visit_medications_attributes_${i}_name" />
          </td>
          <td>
            <input value="${medsJSON[i].ingestionMethod}" class="form-control" type="text" name="visit[medications_attributes][${i}][ingestion_method]" id="visit_medications_attributes_${i}_ingestion_method" />
          </td>
          <td>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_true" value="true"> Continue
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_false" value="false"> Discontinue
              </label>
            </div>
            <input value="${visit.id}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][visit_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${visit.patient_id}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][patient_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${medsJSON[i].topicID}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][topic_id]" id="visit_medications_attributes_${i}_topic_id" />
          </td>
        </tr>`
      )
    } else {
      returnStatement.push(
        `<tr>
          <td>
            <div class="form-inline">
              <input value="${medsJSON[i].name}" class="form-control" type="text" name="visit[medications_attributes][${i}][name]" id="visit_medications_attributes_${i}_name" style=
              "max-width:8em;" />
              <input value="${medsJSON[i].commonName}" class="form-control" type="text" name="visit[medications_attributes][${i}][common_name]" id="visit_medications_attributes_${i}_common_name" style=
              "max-width:8em;" />
            </div>
          </td>
          <td>
            <div class="form-inline">
              <input value="${medsJSON[i].dose}" class="form-control" style="max-width:6em;" type="number" name="visit[medications_attributes][${i}][dose]" id="visit_medications_attributes_${i}_dose" />
              <input value="${medsJSON[i].doseUnitOfMeas}" class="form-control" style="max-width:6em;" type="text" name="visit[medications_attributes][${i}][dose_unit_of_measurement]" id="visit_medications_attributes_${i}_dose_unit_of_measurement" />
              <input value="${medsJSON[i].dosageForm}" class="form-control" type="text" name="visit[medications_attributes][${i}][dosage_form]" id="visit_medications_attributes_${i}_dosage_form" />
            </div>
          </td>
          <td>
            <input value="${medsJSON[i].ingestionMethod}" class="form-control" type="text" name="visit[medications_attributes][${i}][ingestion_method]" id="visit_medications_attributes_${i}_ingestion_method" />
          </td>
          <td>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_true" value="true"> Continue
              </label>
            </div>
            <div class="form-check form-check-inline">
              <label class="form-check-label">
                <input class="form-check-input" type="radio" name="visit[medications_attributes][${i}][current]" id="visit_medications_attributes_${i}_current_false" value="false"> Discontinue
              </label>
            </div>
            <input value="${visit.id}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][visit_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${visit.patient_id}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][patient_id]" id="visit_medications_attributes_${i}_visit_id" />
            <input value="${medsJSON[i].topicID}" class="form-control" type="hidden" name="visit[medications_attributes][${i}][topic_id]" id="visit_medications_attributes_${i}_topic_id" />
          </td>
        </tr>`
      );
    }
  }
  return returnStatement;
};
