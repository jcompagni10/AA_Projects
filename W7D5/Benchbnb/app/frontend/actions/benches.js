import * as APIUtil from '../util/bench_api';
import updateBounds from './filter_actions';

export const RECEIVE_BENCHES = "RECEIVE_BENCHES";


export const receiveBenches = benches => ({
  type: RECEIVE_BENCHES,
  benches
});

export const fetchBenches = (filters) => dispatch =>{

  return APIUtil.getAllBenches(filters)
   .then(benches => dispatch(receiveBenches(benches)),
         errors => console.log(errors)
   );
};

export function updateFilters(bounds) {
  return (dispatch, getState) => {
    dispatch(updateBounds(bounds));
    return fetchBenches(getState().filters)(dispatch);
    // delicious curry!
  };
}
