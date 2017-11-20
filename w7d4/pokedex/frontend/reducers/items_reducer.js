import { RECEIVE_SINGLE_POKEMON} from '../actions/pokemon_action';
import merge from 'lodash/merge';

const itemsReducer = (state={}, action ) => {
  Object.freeze(state);
  switch(action.type) {
    case RECEIVE_SINGLE_POKEMON:
      let items = {};
      action.payload.items.forEach(item=>{
        items[item.id] = item;
      });
      return items;
    default:
      return state;
  }
};

export default itemsReducer;
