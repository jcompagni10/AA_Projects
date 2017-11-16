import { connect } from 'react-redux';
import { requestAllPokemon } from '../../actions/pokemon_action';
import PokemonIndex from './pokemon_index';
import { selectAllPokemon } from '../../reducers/selectors';

const mapStateToProps = state => ({
  pokemon: selectAllPokemon(state)
});

const mapDispatchToProps = dispatch => ({
  requestAllPokemon: () => requestAllPokemon()(dispatch)
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(PokemonIndex);
