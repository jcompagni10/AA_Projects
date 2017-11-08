const Snake = require('./snake.js')

class Board{
  constructor(){
    this.snake = new Snake();
    this.grid = [];
  }
  
  snakeCords(){
    return this.snake.segments
  }
}

module.exports = Board;