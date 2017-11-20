import { getAllTodos, postTodo, patchTodo, deleteTodo } from '../utils/todo_api_util';

export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
export const REMOVE_TODO = 'REMOVE_TODO';

export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const CLEAR_ERRORS = 'CLEAR_ERRORS';

//// todos //////

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

export const fetchTodos = () => dispatch => (
  getAllTodos().then(todos => dispatch(receiveTodos(todos)))
);

export const createTodo = todo => dispatch => (
  postTodo(todo).then(dbTodo => dispatch(receiveTodo(dbTodo)),
                      err => dispatch(receiveErrors(err.responseJSON)))
);

export const updateTodo = todo => dispatch => (
  patchTodo(todo).then(dbTodo => dispatch(receiveTodo(dbTodo)),
                      err => dispatch(receiveErrors(err.responseJSON)))
);

export const destroyTodo = id => dispatch => (
  deleteTodo(id).then(dbTodo => dispatch(removeTodo(dbTodo.id)),
                      err => dispatch(receiveErrors(err.responseJSON)))
);

/////// Errors /////

export const receiveErrors = errors => ({
  type: RECEIVE_ERRORS,
  errors
});

export const clearErrors = () => ({
  type: CLEAR_ERRORS
});
