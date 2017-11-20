import React from 'react';
import merge from 'lodash/merge';

export const TodoListItem = ({todo: {title, body, id}, removeTodo, receiveTodo, todo}) => {
  // maybe deal with dponess text
  let donenessText = (todo.done) ? 'Mark as incompleted' : 'Mark as completed';
  const toggleCompletion = item => {
    // console.log('toggling completion');
    // console.log(merge(todo, {done: !todo.done}));
    receiveTodo(merge(todo, {done: !todo.done}));
  };

  return (<li>
    <span>{title} -- {body}</span>
    <button onClick={() => removeTodo(id)}>Remove Item</button>
    <button onClick={() => toggleCompletion(todo)}>{donenessText}</button>
        </li>);
};
