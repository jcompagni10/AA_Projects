import React from 'react';
import { PokemonIndexItem } from './pokemon_index_item';
import pokemonDetailContainer from './pokemon_detail_container';
import { Route, Switch, Link } from 'react-router-dom';
import createPokemonFormContainer from './create_pokemon_form_container';


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
        <Link to="/pokemon/new">Create Pokemon</Link>
        <ul className="pokemonIndex">
          {this.props.pokemon.map( pokemon => (

              <PokemonIndexItem key={pokemon.id} pokemon={ pokemon } />

          ))}
        </ul>
        <Switch>
          <Route path="/pokemon/new" component={createPokemonFormContainer} />
          <Route path="/pokemon/:id" component={pokemonDetailContainer} />
        </Switch>

      </div>
    );
  }
}

export default PokemonIndex;
