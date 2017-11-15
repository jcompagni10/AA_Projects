import React from 'react';
import ReactDOM from 'react-dom';
import {configureStore} from './store/store.js';
import {receiveTodo, receiveTodos} from './actions/actions.js';
import {Root} from './components/root';
import {allTodos} from './reducers/selectors';




document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.store = store; // TODO: delete me after testing
  window.receiveTodo = receiveTodo;
  window.receiveTodos = receiveTodos;
  // window.allTodos = allTodos;
  ReactDOM.render(<Root store = {store} />, rootEl);
});
