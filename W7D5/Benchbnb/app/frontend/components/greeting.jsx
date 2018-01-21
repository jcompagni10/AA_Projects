import React from 'react';
import {Link} from 'react-router-dom';

export default ({currentUser, logout}) => (
    currentUser ?
    <div>
      <h3>Welcome {currentUser.username}</h3>
      <button onClick ={logout}>Log Out</button>
    </div>
    :
    <div>
      <h2> {currentUser}</h2>
      <Link to="/signup">Sign Up</Link>
      <Link to="/login">Log In</Link>
    </div>
);
