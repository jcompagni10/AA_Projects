import React from 'react';
import { Link } from 'react-router-dom';


export const PokemonIndexItem = ({pokemon}) => (
  <li>
       <h2>{pokemon.name}</h2>
      <Link to={`/pokemon/${ pokemon.id }`}> <img src={pokemon.image_url} /></Link>
  </li>
);
