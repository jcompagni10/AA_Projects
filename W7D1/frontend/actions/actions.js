export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const receiveTodos = todos => ({ // todos is an object of todo objects
  type: RECEIVE_TODOS,
  todos
});

export const receiveTodo = todo => ({ // todo is a single todo object
  type: RECEIVE_TODO,
  todo
});

export const removeTodo = id => ({
  type: REMOVE_TODO,
  id
});
