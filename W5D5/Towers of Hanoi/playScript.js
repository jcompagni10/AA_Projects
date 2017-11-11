const{Game} = require('./game.js');

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

let g = new Game(reader);
let cb = ()=>console.log("GAME OVER!!!!");
g.run(cb);



// Game.prototype.run = function run() {
//   // Start out with a tower stack from biggest to smallest
//   // Move top tower from initial peg to empty
//   // Only a smaller disc can be placed on a bigger disc
//   // Game continues until all (three) discs have been restacked in
//     // correct order fomr big to small in a different peg
//
// };
//
