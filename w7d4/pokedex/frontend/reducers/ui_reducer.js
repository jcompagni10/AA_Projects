import { RECEIVE_SINGLE_POKEMON,
        RECEIVE_ALL_POKEMON} from '../actions/pokemon_action';
import merge from 'lodash/merge';

const uiReducer = (state={}, action ) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      return merge({}, state, {current_pokemon_id:
        Object.keys(action.payload.pokemon)[0]}
      );
    default:
      return state;
  }
};

export default uiReducer;
