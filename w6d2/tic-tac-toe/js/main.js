const View = require("./ttt-view.js")
const Game = require("../solution/game.js")

$( () => {
  let game = new Game();
  $view = $(".ttt");
  $test = new View (game, $view);
  $test.setupBoard();
  $test.bindEvents();
});

