React, { Component } from 'react';

class HelloWorld extends Component {
  render() {
    return(
      <div>
        <p>Hello World {this.props.name}</p>
      </div>
    );
  }
}

export default HelloWorld;
