import { RECEIVE_POKEMON_ERRORS} from '../actions/pokemon_action';
import merge from 'lodash/merge';


export default (state=[], action) =>{
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_POKEMON_ERRORS:
    return action.errors;
  default:
    return state;
  }
};
