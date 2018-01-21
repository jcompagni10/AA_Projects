import { RECEIVE_BENCHES } from '../actions/benches';

const benchReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_BENCHES:
      return Object.assign({}, action.benches);
    default:
      return state;
  }
};

export default benchReducer;
