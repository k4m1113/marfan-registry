# RWR api

## React

  * #### registerComponent [js]
    ```js
    registerComponent(String componentName, class|function component)
    ```

    Register component so it's globally accessible.

    ##### example:

    ```js
    import MyComponent from 'my-component';

    registerComponent('MyComponentName', MyComponent);
    ```

    **note:** Registered components are accessible in globally exposed `RWR.react` under `components` property.

  * #### getComponent [js]

    ```js
    getComponent(String componentName)
    ```

    Shortcut for accessing registered component.

    ##### example:

    ```js
    getComponent('MyComponentName');
    ```

  * #### createComponent [js]

    ```js
    createComponent(String componentName[, Object props])
    ```

    Wrapper over React.createElement that creates ready to render component with props.

    ##### example:

    ```js
    createComponent('MyComponentName', {foo: 'bar'});
    ```

  * #### renderComponent [js]

    ```js
    renderComponent(String componentName, Object props, DOMElement container)
    ```

    Wrapper over `React.render` and `React.createElement`. Renders component with given props into specified DOM element.

    ##### example:

    ```js
    var element = document.getElementById('my-element');
    renderComponent('MyComponentName', {foo: 'bar'}, element);
    ```

  * #### unmountComponent [js]

    ```js
    unmountComponent(DOMElement container)
    ```

    Wrapper over `React.unmountComponentAtNode`. It will unmount component from given DOM node.

    ##### example:

    ```js
    var element = document.getElementById('my-element');
    unmountComponent(element);
    ```


  * ### react_component [ruby]
    #### helper

    ```ruby
    react_component(String component_name[, Object props, Object options])
    ```

    #### renderer

    ```ruby
    render react_component String component_name[, Object options])
    ```

    Creates DOM node with props as data attributes in rendered view, so RWR can grab it and mount proper component.
    Options hash contains customization of React component, such as `tag`, `class`.
    Also, the options hash is the place where you can override the global server-side rendering setting.

    **note:** Props Object will be parsed to JSON. Be careful when passing rails models there - all its data accessible after `.to_json` will be exposed as data-attributes. We recommend using serializers to control it.

    ##### helper example:

    ```ruby
    <%= react_component('MyComponentName', MySerializer.new(my_data), { tag: :ul, class: 'my-class', server_side: true }) %>
    ```

    ##### renderer example:

    ```ruby
    render react_component: 'MyComponentName', props: MySerializer.new(my_data), tag: :ul, server_side: true
    ```
