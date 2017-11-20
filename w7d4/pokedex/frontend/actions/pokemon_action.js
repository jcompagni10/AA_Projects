import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_SINGLE_POKEMON = 'RECEIVE_SINGLE_POKEMON';
export const RECEIVE_POKEMON_ERRORS = 'RECEIVE_POKEMON_ERRORS';


export const receiveAllPokemon = pokemon => ({
  type: RECEIVE_ALL_POKEMON,
  pokemon
});

export const receiveSinglePokemon = payload => {
  console.log("done");
  return{
    type: RECEIVE_SINGLE_POKEMON,
    payload
  };
};

export const requestAllPokemon = () => (dispatch) => (
  APIUtil.fetchAllPokemon()
    .then(pokemon => dispatch(receiveAllPokemon(pokemon)))
);

export const requestSinglePokemon = (id) => (dispatch) => {
  console.log("start load");
  return (APIUtil.fetchSinglePokemon(id)
    .then(payload => dispatch(receiveSinglePokemon(payload))));
};

export const receivePokemonErrors = errors => ({
  type: RECEIVE_POKEMON_ERRORS,
  errors
});

export const createPokemon = (pokemon) => (dispatch) =>(
  APIUtil.createPokemon(pokemon)
    .then((dbPokemon => {
      dispatch(receiveSinglePokemon(dbPokemon));
        return dbPokemon;
      }), (error)=>{dispatch(receivePokemonErrors(error.responseJSON));})

    // .then((dbPokemon => {
    //     dispatch(receiveSinglePokemon(dbPokemon));
    //     return dbPokemon;
    //   }),
    //   errors => (receivePokemonErrors(errors.responseJSON))
    // )
);
