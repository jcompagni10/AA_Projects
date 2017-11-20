import React from "react";
import {requestSinglePokemon} from '../../actions/pokemon_action';
import PokemonDetail from './pokemon_detail';
import {connect} from 'react-redux';
import {selectCurrentPokemon} from '../../reducers/selectors';

const mapStateToProps = (state) =>(
  {pokeData: selectCurrentPokemon(state)}
);

const mapDispatchToProps = dispatch =>{
  return {
    requestSinglePokemon: (id)=>requestSinglePokemon(id)(dispatch)
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonDetail);
