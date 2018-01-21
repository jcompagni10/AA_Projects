import React from 'react';
import {connect} from 'react-redux';
import {login, signupUser} from '../../actions/session';
import SessionForm from './SessionForm';


const mapStateToProps = (state, ownProps) =>({
  loggedIn: state.currentUser,
  errors: state.errors.session,
  formType: ownProps.location.pathname.slice(1)
});

const mapDispatchToProps = (dispatch, ownProps) =>({
  action:
  (ownProps.location.pathname.slice(1) === 'signup') ?
  (formUser)=>dispatch(signupUser(formUser)) : (formUser)=>dispatch(login(formUser))
});

export default connect(mapStateToProps, mapDispatchToProps)(SessionForm);
