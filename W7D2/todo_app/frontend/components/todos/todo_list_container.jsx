import {connect} from 'react-redux';
import {TodoList} from './todo_list';
import {allTodos,
        allErrors} from '../../reducers/selectors';
import {fetchTodos,
        createTodo,
        updateTodo,} from '../../actions/actions';

const mapStateToProps = state => ({
  todos: allTodos(state),
  errors: allErrors(state)
});

const mapDispatchToProps = dispatch => ({
  fetchTodos: () => dispatch(fetchTodos()),
  createTodo: todo => dispatch(createTodo(todo)),
  updateTodo: todo => dispatch(updateTodo(todo)),
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
