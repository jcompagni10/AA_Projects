import React from 'react';

export class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const todo = this.props.todo;
    return (
      <div>
        <div>{todo.body}</div>
        <button onClick={() => this.props.destroyTodo(todo.id)}>
          Remove Item
        </button>
      </div>
    );
  }
}
