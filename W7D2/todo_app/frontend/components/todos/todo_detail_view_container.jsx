import {connect} from 'react-redux';
import {TodoDetailView} from './todo_detail_view';

import {destroyTodo} from '../../actions/actions';

// const mapStateToProps = (_state, ownProps) => ({
// });

const mapDispatchToProps = dispatch => ({
  destroyTodo: id => dispatch(destroyTodo(id))
});

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);
