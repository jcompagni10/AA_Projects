import {combineReducers} from 'redux';
import {errorReducer} from './error_reducer';
import {todosReducer} from './todos_reducer';



export const rootReducer = combineReducers({todos: todosReducer, error: errorReducer});
