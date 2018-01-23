import expect, { spyOn, createSpy } from 'expect';
import Nodes from '../src/nodes';
import IntegrationsManager from '../src/integrations-manager';

const { mountNodes, unmountNodes, reloadNodes } = Nodes;

const node = {
  nodeType: 1,
  nodeName: 'DIV',
  getAttribute: createSpy().andCall(function (attribute) {
    return {
      'data-react-element': 'data-react-component',
      'data-payload': '{"color":"sampleColor"}',
      'data-integration-name': 'basicIntegration',
      'data-options': '{"prerender":false}',
    }[attribute];
  }),
};

describe('Nodes', function () {
  beforeEach(function () {
    IntegrationsManager.register(
      'basicIntegration',
      {
        mount: () => {},
        unmount: () => {},
      }
    );
  });

  afterEach(function () {
    IntegrationsManager.integrations = {};
    expect.restoreSpies();
  });

  describe('#mountNodes', function () {
    context('when nodes could not be found', function () {
      beforeEach(function () {
        global.document = {
          querySelectorAll: createSpy().andReturn([]),
        };
      });

      it('does nothing', function () {
        const mountSpy = spyOn(IntegrationsManager.get('basicIntegration'), 'mount');
        mountNodes('[selectorWithoutNodes]');

        expect(mountSpy.calls.length).toEqual(0);
      });
    });

    context('when nodes were found', function () {
      beforeEach(function () {
        global.document = {
          querySelectorAll: createSpy().andReturn([node]),
        };
      });

      it('uses "data-rwr-element" as default selector', function () {
        const documentSpy = spyOn(document, 'querySelectorAll');
        mountNodes();

        expect(documentSpy.calls.length).toEqual(1);
        expect(documentSpy).toHaveBeenCalledWith('[data-rwr-element]');
      });

      it('mounts nodes', function () {
        const mountSpy = spyOn(IntegrationsManager.get('basicIntegration'), 'mount');
        const documentSpy = spyOn(document, 'querySelectorAll');
        mountNodes('[selectorWithNodes]');

        expect(mountSpy.calls.length).toEqual(1);
        expect(documentSpy.calls.length).toEqual(1);
        expect(documentSpy).toHaveBeenCalledWith('[selectorWithNodes]');
      });
    });
  });

  describe('#unmountNodes', function () {
    context('when nodes could not be found', function () {
      beforeEach(function () {
        global.document = {
          querySelectorAll: createSpy().andReturn([]),
        };
      });

      it('does nothing', function () {
        const unmountSpy = spyOn(IntegrationsManager.get('basicIntegration'), 'unmount');
        unmountNodes('[selectorWithoutNodes]');

        expect(unmountSpy.calls.length).toEqual(0);
      });
    });

    context('when nodes were found', function () {
      beforeEach(function () {
        global.document = {
          querySelectorAll: createSpy().andReturn([node]),
        };
      });

      it('uses "data-rwr-element" as default selector', function () {
        const documentSpy = spyOn(document, 'querySelectorAll');
        unmountNodes();

        expect(documentSpy.calls.length).toEqual(1);
        expect(documentSpy).toHaveBeenCalledWith('[data-rwr-element]');
      });

      it('unmounts nodes', function () {
        const unmountSpy = spyOn(IntegrationsManager.get('basicIntegration'), 'unmount');
        const documentSpy = spyOn(document, 'querySelectorAll');
        unmountNodes('[selectorsWithNodes]');

        expect(unmountSpy.calls.length).toEqual(1);
        expect(documentSpy.calls.length).toEqual(1);
        expect(documentSpy).toHaveBeenCalledWith('[selectorsWithNodes]');
      });
    });
  });

  describe('#reloadNodes', function () {
    it('is equal to mountNodes', function () {
      expect(reloadNodes).toEqual(mountNodes);
    });
  });
});
