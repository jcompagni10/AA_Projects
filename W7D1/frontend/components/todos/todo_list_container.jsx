import {connect} from 'react-redux';
import {TodoList} from './todo_list';
import {allTodos} from '../../reducers/selectors';
import {receiveTodo, receiveTodos, removeTodo} from '../../actions/actions';

const mapStateToProps = state => ({
  todos: allTodos(state)
});

const mapDispatchToProps = dispatch => ({
  receiveTodos: todos => dispatch(receiveTodos(todos)),
  receiveTodo: todo => dispatch(receiveTodo(todo)),
  removeTodo: id => dispatch(removeTodo(id))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
