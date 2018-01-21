import React from 'react';
import {connect} from 'react-redux';
import {fetchBenches} from '../../actions/benches';
import BenchIndex from './BenchIndex';



const mapStateToProps = (state) =>{
  return {
  benches: Object.keys(state.entities.benches).map(key=>(state.entities.benches[key]))
};};

const mapDispatchToProps = dispatch =>({
  fetchBenches: () => dispatch(fetchBenches())
});

export default connect(mapStateToProps, mapDispatchToProps)(BenchIndex);
