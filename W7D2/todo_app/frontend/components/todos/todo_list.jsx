import React from 'react';
import {TodoListItem} from './todo_list_item';
import {TodoForm} from './todo_form';
import {Errors} from './errors';

export class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    return (
      <div>

        <ul>
          {this.props.todos.map(todo => (
            <TodoListItem key={todo.id}
                          todo={todo}
                          destroyTodo={this.props.destroyTodo}
                          updateTodo={this.props.updateTodo} />
          ))}
        </ul>
        {(this.props.errors.length === 0 ? '' : <Errors errors={this.props.errors} /> )}
         <TodoForm createTodo={this.props.createTodo}/>
      </div>
    );
  }
}
