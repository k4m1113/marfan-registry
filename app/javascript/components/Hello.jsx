import React from 'react';
import ReactDOM from 'react-dom'

export default class Hello extends React.Component {
  render() {
    return (
      <h1>Hi, I'm SampleComponent!</h1>
    );
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <Hello name="React" />,
    document.body.appendChild(document.createElement('div')),
  )
})
