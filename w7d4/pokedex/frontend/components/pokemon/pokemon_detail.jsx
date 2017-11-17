import React from 'react';
import {Route} from 'react-router';
import {Link} from 'react-router-dom';
import ItemDetailContainer from '../items/item_detail_container';
import values from 'lodash/values';

class PokemonDetail extends React.Component{

  componentDidMount(){
    let pokemonId = this.props.match.params.id;
    this.props.requestSinglePokemon(pokemonId);
  }

  componentWillReceiveProps(nextProps){
    let pokemonId = nextProps.match.params.id;
    if (this.props.pokeData.pokemon &&
      (pokemonId != this.props.pokeData.pokemon.id)){
        this.render()
    }
  }

  allItems(){
    return values(this.props.pokeData.items);
  }

  render(){
    const pokemon = this.props.pokeData.pokemon;
    if (!pokemon){
      return (
        <div id="loading-pokeball-container">
          <div id="loading-pokeball"></div>
        </div>
      );
    }
    return(
      <div className = "pokemon-detail">

        <h1>{pokemon.name}</h1>
        <img src = {pokemon.image_url}/>
        <h4>Items</h4>
        <ul className="items">
          {this.allItems().map((item)=>(
            <li key = {item.id}>
              <Link to={this.props.match.url+"/item/"+item.id}>
                {item.name}
              </Link>
            </li>
          ))}
        </ul>
        <Route path = "/pokemon/:pokemonId/item/:itemId"
          component={ItemDetailContainer} />
      </div>
    );
  }
}

export default PokemonDetail;
