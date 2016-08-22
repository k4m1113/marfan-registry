import React, { Component } from 'react'
import ReactDOM from 'react-dom'

class helloWorld extends Component {
  render() {
    return (
      <h1>Hello World!</h1>
    )
  }
}

ReactDOM.render(<helloWorld/>, document.getElementsByID('mount'))
