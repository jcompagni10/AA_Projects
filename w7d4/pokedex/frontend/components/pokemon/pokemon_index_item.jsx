import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = ({pokemon}) => (
  <li>
    <Link to={`/pokemon/${ pokemon.id }`}>
       <h4>{pokemon.name}</h4>
        <img src={pokemon.image_url} />
      </Link>
  </li>
);
