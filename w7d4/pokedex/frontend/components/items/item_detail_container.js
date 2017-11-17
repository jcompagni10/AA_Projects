import react from "react";
import {connect} from 'react-redux';
import {selectPokemonItem} from '../../reducers/selectors';
import itemDetail from './item_detail';

const mapStateToProps = (state, ownProps) =>{
  const itemId = ownProps.match.params.itemId;
  return {item: selectPokemonItem(state, itemId)};
};

export default connect(mapStateToProps, null)(itemDetail);
