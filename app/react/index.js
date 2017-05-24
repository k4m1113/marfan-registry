import RWR from 'react-webpack-rails';
RWR.run();

if (module.hot) {
  module.hot.accept();
  RWR.reloadNodes();
}
