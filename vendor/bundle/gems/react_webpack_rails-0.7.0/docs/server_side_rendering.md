Server-Side Rendering
=======
Server-side processing enables execution of any JavaScript code on the server side. The React integration we have prepared allows you to render React components to string on the server. The integration accepts component name and props, and returns valid HTML ([see API](https://github.com/netguru/react_webpack_rails/blob/master/docs/api.md#react_component-ruby)). This happens using provided node server. After running RWR install generator, you will find the server code in `app/react/` directory: `node_server.js`. You must ensure it is up and running if you want to use the SSR (or any other server-side processing of JavaScript). We use [Forever](https://github.com/foreverjs/forever) to keep the node server up. It handles watch and reload, and enables running and tracking background processes. Should you use current package.json, there are scripts ready to run:  
  * running on development:
    ```bash
    npm run rwr-node-dev-server
    ```
  * running on production (foregroud):
  ```bash
    npm run rwr-node-server
  ```
  
To set the node server address, override this option to a string of your choice:
```ruby
  Rails.application.config.rwr.node_server_host
```

### How to use SSR:

```erb
<%# A view in erb %>
<%= react_component('HelloWorld', { name: @name }, server_side: true) %>
```
`HelloWorld` is the name of the react component, which has to be `import`ed and `register`ed in your `app/react/index.js` like so:
```js
import HelloWorld from './components/hello-world';
RWR.registerComponent('HelloWorld', HelloWorld);
```
`{ name: @name }` is the component's props, and the option `server_side: true` turns SSR on. By default it is set to `false`. You can change it globally by setting the following config option to a Boolean value of your choice:
```ruby
Rails.application.config.react.server_side
```
This global config may be overridden by passing the `server_side` option to a specific `react_component` invocation.
