import {RECEIVE_ERRORS, CLEAR_ERRORS} from '../actions/actions';

const initialState = [];

export const errorReducer = (state = initialState, action) => {
  console.log("tope of e reducer", action);
  Object.freeze(state);
  switch(action.type){
    case RECEIVE_ERRORS:
    console.log("receieve errors", action);
      return action.errors;
    case CLEAR_ERRORS:
      return initialState;
    default:
      return state;
  }
};
