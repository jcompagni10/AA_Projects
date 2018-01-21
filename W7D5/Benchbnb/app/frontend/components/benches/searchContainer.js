import React from 'react';
import {connect} from 'react-redux';
import {fetchBenches} from '../../actions/benches';
import search from './search';
import {updateBounds} from '../../actions/filter_actions';


const mapStateToProps = (state) =>{
  return {
  benches: state.entities.benches
};};

const mapDispatchToProps = (dispatch, state) =>({
  fetchBenches: () => dispatch(fetchBenches()),
  updateBounds: bounds=>dispatch(updateBounds(bounds))
});

export default connect(mapStateToProps, mapDispatchToProps)(search);
