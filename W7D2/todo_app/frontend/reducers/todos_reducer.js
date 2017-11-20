import { RECEIVE_TODO, RECEIVE_TODOS, REMOVE_TODO } from '../actions/actions';
import merge from 'lodash/merge';

const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

export const todosReducer = (state = initialState, action) => {
  Object.freeze(state);
  let oldState;
  switch(action.type) {
    case RECEIVE_TODO:
      console.log('receiving todo');
      console.log(action);
      const newId = action.todo.id;
      return merge({}, state, {[newId]: action.todo});
    case RECEIVE_TODOS:
      const todosObj = {};
      action.todos.forEach((todo) => {
        todosObj[todo.id] = todo;
      });
      return todosObj;
    case REMOVE_TODO:
      oldState = merge({}, state);
      delete oldState[action.id];
      return oldState;
    default:
      return state;
  }
};
