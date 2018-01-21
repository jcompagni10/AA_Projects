import React from 'react';
import {connect} from 'react-redux';
import greeting from './greeting';
import {logout} from '../actions/session';

const mapStateToProps = state =>({
  currentUser: state.session.currentUser
});

const mapDispatchToProps = dispatch =>({
  logout: ()=>dispatch(logout())
});
export default connect(mapStateToProps, mapDispatchToProps)(greeting);
