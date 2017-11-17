import React from "react";
import {connect} from 'react-redux';
import {createPokemon} from '../../actions/pokemon_action';
import createPokemonForm from './create_pokemon_form';

const mapDispatchToProps = dispatch =>({
  createPokemon: (pokemon) => createPokemon(pokemon)(dispatch)
});

const mapStateToProps = state =>({
  errors: state.errors
});

export default connect(mapStateToProps, mapDispatchToProps)(createPokemonForm);
