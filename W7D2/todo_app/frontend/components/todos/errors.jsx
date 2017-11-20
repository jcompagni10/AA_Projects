import React from 'react';

export const Errors = ({errors}) => (
  <div class= "errors">
    <h2>ERRORS</h2>
    <ul>
      {errors.forEach((e)=>(
        <li>{e}</li>
      ))}
    </ul>
</div>
);
