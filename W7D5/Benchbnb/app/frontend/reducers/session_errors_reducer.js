import {RECEIVE_SESSION_ERRORS, RECEIVE_CURRENT_USER} from '../actions/session';

export default (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_SESSION_ERRORS:
      newState = Object.assign({}, state);
      newState['session'] = action.errors;
      return newState;
    case RECEIVE_CURRENT_USER:
      newState = Object.assign({}, state);
      newState['session'] = [];
      return newState;
    default:
      return state;
  }
};
