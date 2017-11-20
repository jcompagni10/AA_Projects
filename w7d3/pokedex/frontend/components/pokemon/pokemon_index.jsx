import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';


class PokemonIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount (){
    this.props.requestAllPokemon();
  }

  render () {
    return (
      <div>
        <ul>
          {this.props.pokemon.map( pokemon => (

              <PokemonIndexItem key={pokemon.id} pokemon={ pokemon } />

          ))}
        </ul>
      </div>
    );
  }
}

export default PokemonIndex;
