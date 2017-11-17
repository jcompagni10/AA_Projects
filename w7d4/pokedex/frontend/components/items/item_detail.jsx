import React from 'react';

export default (props)=>(
  <div>
    <h4>Item Detail:</h4>
    <h4>
      <img className="thumbnail" src={props.item.image_url}/>
      <ul>
        <li>{props.item.name}</li>
        <li>Price: {props.item.price} Bitcoins</li>
      </ul>
    </h4>
  </div>
);
