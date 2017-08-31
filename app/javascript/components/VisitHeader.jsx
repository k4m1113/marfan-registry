const primaryDiagnoses = [
  'Marfan Syndrome',
  'Loeys-Dietz Syndrome',
  'Ehlers-Danlos Syndrome',
  'Beals Syndrome',
  'familial thoracic aneurysm and dissection',
  'ectopia lentis',
  'mass phenotype',
  'bicuspid aortic valve',
  'Stickler Syndrome',
  'Shprintzen-Goldberg Syndrome'
]
import React from 'react';
import ReactDOM from 'react-dom'

export default class VisitHeader extends React.Component {
  render() {
    const options = primaryDiagnoses.map(d =>
      <label className="btn btn-secondary">
        <input type="radio" autocomplete="off" name="visit[patient_attributes][primary_diagnosis]" value="{d}" />
        {d}
      </label>
    )
    return (
      <div className="alert alert-warning alert-dismissible fade show" role="alert">
        <button type="button" className="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>Primary Diagnosis:
        {options}
        </div>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const patient = document.getElementById('patientinfo')
  const patientdata = JSON.parse(patient.getAttribute('data'))

  ReactDOM.render(
    <VisitHeader patient={patientdata} />,
    document.body.appendChild(document.createElement('div')),
  )
})
