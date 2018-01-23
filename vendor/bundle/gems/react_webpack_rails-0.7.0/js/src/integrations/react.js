import React from 'react';
import ReactDOM from 'react-dom';
import ReactDOMServer from 'react-dom/server';
import { AppContainer } from 'react-hot-loader';

class ReactIntegration {
  constructor() {
    this.components = {};
    this.registerComponent = this.registerComponent.bind(this);
    this.getComponent = this.getComponent.bind(this);
    this.createComponent = this.createComponent.bind(this);
    this.renderComponent = this.renderComponent.bind(this);
    this.unmountComponent = this.unmountComponent.bind(this);
    this.renderComponentToString = this.renderComponentToString.bind(this);
  }

  registerComponent(...args) {
    if (typeof args[0] === 'object') {
      const component = args[0];
      this.components = Object.assign({}, this.components, component);
    }

    const [name, component] = args;
    this.components[name] = component;
  }

  registerComponents(components) {
    this.components = Object.assign({}, this.components, components);
  }

  getComponent(name) {
    return this.components[name];
  }

  createComponent(name, props) {
    const constructor = this.getComponent(name);
    const element = React.createElement(constructor, props);
    return React.createElement(AppContainer, null, element);
  }

  renderComponent(name, props, node) {
    const component = this.createComponent(name, props);
    this._attachIntegrationData(node, name, props);
    ReactDOM.render(component, node);
  }

  unmountComponent(node) {
    ReactDOM.unmountComponentAtNode(node);
  }

  renderComponentToString(name, props) {
    const component = this.createComponent(name, props);
    return ReactDOMServer.renderToString(component);
  }

  get integrationWrapper() {
    return {
      mount: function _mount(node, payload) {
        this.renderComponent(payload.name, payload.props, node);
      }.bind(this),

      unmount: function _unmount(node) {
        this.unmountComponent(node);
      }.bind(this),

      nodeRun: function _prerender(payload) {
        return this.renderComponentToString(payload.name, payload.props);
      }.bind(this),
    };
  }

  _attachIntegrationData(node, name, props) {
    const nativeNode = node.selector ? node[0] : node; // normalize jquery objects to native nodes
    const dataset = nativeNode.dataset;
    if (dataset.rwrElement) return;
    dataset.rwrElement = 'true';
    dataset.integrationName = 'react-component';
    dataset.payload = JSON.stringify({ name, props });
  };
}

export default new ReactIntegration;
