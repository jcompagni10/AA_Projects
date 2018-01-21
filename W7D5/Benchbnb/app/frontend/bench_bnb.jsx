import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = {session: {currentUser: window.currentUser}};

  const store = configureStore(preloadedState);
  const rootEl = document.getElementById('root');
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
