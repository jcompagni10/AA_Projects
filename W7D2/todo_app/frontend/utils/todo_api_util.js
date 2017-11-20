export const getAllTodos = () => {
  return $.ajax({
    method: 'get',
    url: 'api/todos'
  });
};

export const postTodo = (todo) => {
  return $.ajax({
    method: 'post',
    url: 'api/todos',
    data: {todo}
  });
};

export const patchTodo = (todo) => {
  return $.ajax({
    method: 'patch',
    url: `api/todos/${todo.id}`,
    data: {todo}
  });
};

export const deleteTodo = (id) => {
  return $.ajax({
    method: 'delete',
    url: `api/todos/${id}`
  });
};
