Install Generator
=======

`Install` generator is build from 6 independent generators responsible for different parts of installation process. All steps except core generator can be skipped by passing one of possible [options]().

```bash
$ rails generate react_webpack_rails:install
```

Install generator run with default options will create following structure:

```
├── app
│   ├── react
│   │   ├── components
│   │   │   ├── hello-world.jsx (example)
│   │   │   └── hello-world-test.jsx (example)
│   │   ├── index.js (core)
│   │   └── node_server.js (server_side)
│   ├── views
│   │   ├── layouts
│   │   │   └── _react_hot_assets.html.erb (hot_relaod)
│   │   └── react_examples
│   │       └── component.html.erb (example)
│   ├── assets
│   │   └── javascripts
│   │       └──react_bundle.js (core)
│   └── controllers
│       └── react_examples_controller.rb (example)
├── webpack
│   ├── dev.config.js (core)
│   ├── hot-dev.config.js (hot_reload)
│   ├── production.config.js (core)
│   └── tests.config.js (karma_setup)
├── forever
│   ├── development.json (server_side)
│   └── production.json (server_side)
├── .babelrc (core)
├── karma.conf.js (karma_setup)
├── package.json (core)
└── webpack.config.js (core)
```

And modify:
- `config/routes.rb` by adding a route for example component,
- `app/views/layouts/application.html.erb` by adding hot_reload partial.

### Options
* `--no-example` - skip example generator
* `--no-hot-reload` - skip hot_reload generator
* `--no-server-side` - skip server_side  generator
* `--no-karma-setup` - skip karma_setup generator
* `--redux` - install and setup [`rwr-redux`](https://github.com/netguru/rwr-redux) gem

*Detailed description of generators coming soon...*
