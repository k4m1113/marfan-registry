# Hot reloading

## Migration to react-hot-loader v3

RWR is now using react-hot-loader v3 instead of v1 (https://github.com/netguru/react_webpack_rails/pull/143)

V3 is a complete overhaul which fixes many problems with previous version, i.e. reloading functional components.

The upgrade requires a few steps which can be applied automatically via our generator:

```
bundle exec rails generate react_webpack_rails:install:hot_reload
```


Detailed steps are outlined below:

1. Bump `react-hot-loader` version in `package.json` file

```
"react-hot-loader": "^3.0.0-beta.6"
```

2. Replace react-hot with `react-hot-loader/webpack` in `webpack/hot-dev.config.js` file

```javascript
jsxLoader.loaders.unshift('react-hot-loader/webpack');
```

3. Add `react-hot-loader/patch` in `webpack/hot-dev.config.js` file

```javascript
config.entry.main.unshift('react-hot-loader/patch')
```

4. Add following code at the bottom of your `app/react/index.js` file to enable hot-reloading:

```javascript
if (module.hot) {
  module.hot.accept();
  RWR.reloadNodes();
}
```
