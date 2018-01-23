import env from './env';
import nodes from './nodes';
import integrationsManager from './integrations-manager';
import react from './integrations/react';
import version from './version';

export { react as react };
export { nodes as nodes };
export { integrationsManager as integrationsManager };
export { env as env };

class RWR {
  constructor() {
    this.version = version;

    this.registerComponent = react.registerComponent;
    this.getComponent = react.getComponent;
    this.createComponent = react.createComponent;
    this.renderComponent = react.renderComponent;
    this.unmountComponent = react.unmountComponent;

    this.mountNodes = nodes.mountNodes;
    this.unmountNodes = nodes.unmountNodes;
    this.reloadNodes = nodes.reloadNodes;
  }

  run() {
    if (typeof(window) !== 'undefined') {
      window.RWR = this;
    } else {
      global.RWR = this;
    }
  }
}

export default new RWR;
