import {createStore} from 'redux';
import {rootReducer} from '../reducers/root_reducer';

export function configureStore(){
  return createStore(rootReducer);
}
