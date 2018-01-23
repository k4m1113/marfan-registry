import expect, { spyOn } from 'expect';
import React, { PropTypes } from 'react';
import ReactDOM from 'react-dom';
import { AppContainer } from 'react-hot-loader';
import subject from '../../src/integrations/react';

class HelloComponent extends React.Component {
  static propTypes() {
    return {
      username: PropTypes.string.isRequired,
    };
  }

  render() {
    return (<div>Hello World! {this.props.username}</div>);
  }
}

class FooComponent extends React.Component {
  static propTypes() {
    return {
      username: PropTypes.string.isRequired,
    };
  }

  render() {
    return (<div>Foo! Bar!</div>);
  }
}

describe('ReactIntegration', function () {
  afterEach(function () {
    subject.components = {};
  });

  describe('.constructor', function () {
    it('intializes empty components dictionary', function () {
      expect(subject.components).toEqual({});
    });
  });

  describe('#registerComponent', function () {
    it('registers component using separate args', function () {
      subject.registerComponent('HelloWorld', HelloComponent);
      expect(subject.components.HelloWorld).toBe(HelloComponent);
    });

    it('registers component using Object', function () {
      subject.registerComponent({ HelloComponent });
      expect(subject.components.HelloComponent).toBe(HelloComponent);
    });
  });

  describe('#registerComponents', function () {
    it('adds multiple components', function () {
      subject.registerComponents({ HelloComponent, FooComponent });
      expect(subject.components.HelloComponent).toBe(HelloComponent);
      expect(subject.components.FooComponent).toBe(FooComponent);
    });
  });

  describe('#getComponent', function () {
    it('returns component by name', function () {
      subject.registerComponent('HelloWorld', HelloComponent);
      expect(subject.getComponent('HelloWorld')).toBe(HelloComponent);
    });

    it('returns undefined if component is not found', function () {
      expect(subject.getComponent('HelloWorld')).toBe(undefined);
    });
  });

  describe('#createComponent', function () {
    it('creates component with given props wrapped in AppContainer for hot-reloading', function () {
      subject.registerComponent('HelloWorld', HelloComponent);
      const wrapper = subject.createComponent('HelloWorld', { username: 'testUser' });

      expect(wrapper.type).toBe(AppContainer);

      const component = wrapper.props.children;
      expect(component.props).toEqual({ username: 'testUser' });
      expect(component.type).toBe(HelloComponent);
    });
  });

  describe('#unmountComponent', function () {
    it('unmount component at specified node', function () {
      const node = { nodeType: 1, nodeName: 'DIV' };
      const unmountSpy = spyOn(ReactDOM, 'unmountComponentAtNode');
      subject.unmountComponent(node);

      expect(unmountSpy.calls.length).toEqual(1);
      expect(unmountSpy).toHaveBeenCalledWith({ nodeType: 1, nodeName: 'DIV' });
    });
  });

  describe('#renderComponent', function () {
    it('attaches integration data to node', function () {
      const node = { nodeType: 1, nodeName: 'DIV', dataset: {} };
      const props = { key: 1 };
      const reactSpy = spyOn(ReactDOM, 'render');
      subject.renderComponent('componentName', props, node);
      expect(node.dataset.rwrElement).toEqual('true');
      expect(node.dataset.integrationName).toEqual('react-component');
      expect(node.dataset.payload).toEqual('{"name":"componentName","props":{"key":1}}');
    });
  });

  describe('#integrationWrapper', function () {
    const node = { nodeType: 1, nodeName: 'DIV' };

    describe('function mount', function () {
      it('calls renderComponent', function () {
        const payload = { name: 'componentName', props: { username: 'testUser' } };
        const mountSpy = spyOn(subject, 'renderComponent');
        subject.integrationWrapper.mount(node, payload);

        expect(mountSpy.calls.length).toEqual(1);
        expect(mountSpy).toHaveBeenCalledWith(
          'componentName',
          { username: 'testUser' },
          { nodeType: 1, nodeName: 'DIV' }
        );
      });
    });

    describe('function unmount', function () {
      it('calls unmountComponent', function () {
        const unmountSpy = spyOn(subject, 'unmountComponent');
        subject.integrationWrapper.unmount(node);

        expect(unmountSpy.calls.length).toEqual(1);
        expect(unmountSpy).toHaveBeenCalledWith({ nodeType: 1, nodeName: 'DIV' });
      });
    });
  });
});
