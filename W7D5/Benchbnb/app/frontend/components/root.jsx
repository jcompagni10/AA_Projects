import React from 'react';
import {HashRouter} from 'react-router-dom';
import App from './App';
import {Provider} from 'react-redux';

export default ({store}) => (
  <Provider store = {store}>
    <HashRouter>
      <App />
    </HashRouter>
  </Provider>
);
