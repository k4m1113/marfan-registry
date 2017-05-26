import React from 'react';
import ReactDOM from 'react-dom';

class ReactOne extends React.Component {
  render() {
    return(
      <div>
        <p>Hello World {this.props.name}</p>
      </div>
    );
  }
}

document.addEventListener("DOMContentLoaded", e => {
  ReactDOM.render(<Hello name="React" />, document.body.appendChild(document.createElement('div')))
})
