import React from 'react';
import GreetingContainer from './greetingContainer';
import sessionFormContainer from './session/sessionFormContainer';
import {Route} from 'react-router-dom';
import {AuthRoute, ProtectedRoute} from '../util/route_util';
import searchContainer from './benches/searchContainer';


export default () =>(
  <div>
    <header>
      <h1 name="test">Benchez bro</h1>
      <GreetingContainer />
    </header>
    <ProtectedRoute exact path="/" component ={searchContainer} />
    <AuthRoute path="/login" component={sessionFormContainer} />
    <AuthRoute path="/signup" component={sessionFormContainer} />
  </div>
);
