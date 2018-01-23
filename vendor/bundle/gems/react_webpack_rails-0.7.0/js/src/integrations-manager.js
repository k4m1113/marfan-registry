import reactIntegration from './integrations/react';

class IntegrationsManager {
  constructor() {
    this.integrations = {
      'react-component': reactIntegration.integrationWrapper,
    };
  }

  get(name) {
    const integration = this.integrations[name];
    if (integration === undefined) {
      throw new Error(
        `Missing '${name}' integration, register appropriate integration in react/index.js`
      );
    }

    return integration;
  }

  register(name, integration) {
    this.integrations[name] = integration;
  }

  runNodeIntegration(data) {
    let result = '';
    const { nodeRun } = this.get(data.integrationName);
    if (typeof(nodeRun) === 'function') {
      result = nodeRun(data.payload);
    }
    return result;
  }
}

export default new IntegrationsManager;
