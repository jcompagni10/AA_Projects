import React from 'react';
import merge from 'lodash/merge';
import TodoDetailViewContainer from './todo_detail_view_container';

// export const TodoListItem = ({todo: {title, body, id},
//                               destroyTodo,
//                               updateTodo,
//                               todo}) => {
//   // maybe deal with dponess text
//   let donenessText = (todo.done) ? 'Mark as incompleted' : 'Mark as completed';
//   const toggleCompletion = item => {
//     // console.log('toggling completion');
//     // console.log(merge(todo, {done: !todo.done}));
//     updateTodo(merge(todo, {done: !todo.done}));
//   };
//
//   return (<li>
//     <span>{title}</span>
//     <button onClick={() => toggleCompletion(todo)}>{donenessText}</button>
//     <TodoDetailViewContainer todo={todo} />
//         </li>);
// };
export class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
  }

  donenessText() {
    return this.props.todo.done ? 'Mark as incompleted' : 'Mark as completed';
  }

  toggleCompletion() {
    this.props.updateTodo(merge(this.props.todo, {done: !this.props.todo.done}));
  }

  render() {
    const todo = this.props.todo;
    return (<li>
      <span>{todo.title}</span>
      <button onClick={this.toggleCompletion.bind(this)}>
        {this.donenessText()}
      </button>
      <TodoDetailViewContainer todo={todo} />
          </li>);
  }
}
