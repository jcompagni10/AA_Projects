import React from 'react';
import ReactDOM from 'react-dom';
import Main from './main';
import Clock from './clock';
import Tab from './tabs';
import Weather from './weather';

document.addEventListener("DOMContentLoaded", ()=> {
  const main = document.getElementById("main");
   ReactDOM.render(<Clock />, main);
   let tabs =[{title: "one", content:"I am the first"},{title: "two", content:"Second pane here"},{title: "three", content:"Third pane here"}];
   ReactDOM.render(<Tab tabArr={tabs} />, document.getElementById("tabs"));
   ReactDOM.render(<Weather />, document.getElementById("weather"));
 });
