import { combineReducers } from 'redux';

import benchReducer from './bench_reducer';


const entitiesReducer = combineReducers({
  benches: benchReducer
});

export default entitiesReducer;
