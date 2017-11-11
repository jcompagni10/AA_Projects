const View = require("./snake-view.js");

$(() =>{
  const el = $("#snake");
  // const board = new Board();
  const view = new View(el);
  view.buildGrid();
  view.render();
})