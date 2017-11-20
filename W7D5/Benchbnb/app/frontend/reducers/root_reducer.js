import errorsReducer from './errors_reducer';
import sessionReducer from './session_reducer';
import { combineReducers } from 'react-redux';

const rootReducer = combineReducers({
  session: sessionReducer,
  errors: errorsReducer
});

export default rootReducer;
