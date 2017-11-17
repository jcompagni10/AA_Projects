import { values } from 'lodash';

export const selectAllPokemon = state => (
  values(state.entities.pokemon)
);

export const selectCurrentPokemon = state => {
  let currentId = state.ui.current_pokemon_id;
  return {pokemon:state.entities.pokemon[currentId],
          items: state.entities.items};
};

export const selectPokemonItem = (state, id) =>(
  state.entities.items[id]
);
