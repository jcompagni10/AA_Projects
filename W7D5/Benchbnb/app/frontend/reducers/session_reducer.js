import { RECEIVE_CURRENT_USER } from '../actions/session';

export default (state = {currentUser: null}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return Object.assign({}, {currentUser: action.currentUser});
    default:
      return state;
  }
};
