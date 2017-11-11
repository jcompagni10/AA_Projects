const Snake = require('./snake.js');

class Board{
  constructor(){
    this.snake = new Snake();
    this.boardsize = 20;
    this.randomApple();
    this.score = 0;
  }

  snakeCords(){
    return this.snake.segments;
  }

  randomApple(){
    let pos = [];
    pos[0] = Math.floor(Math.random() * this.boardsize);
    pos[1] = Math.floor(Math.random() * this.boardsize);
    this.apple = pos;
  }

  update(){
    let status = true;
    this.snake.move();
    let head = this.snake.headPos();
    if (head[0] === this.apple[0] && head[1] === this.apple[1]){
      this.snake.addLength();
      this.randomApple();
      this.score++;
      this.updateScore();
    }
    if (head[0] > this.boardsize -1 || head[0] < 0 || head[1] > this.boardsize-1 || head[1] < 0 || this.bodyCol()){
      alert("you suck");
      status = false;
    }
    return status;
  }

  bodyCol(){
    let body = this.snake.segments.slice(1).map((el)=> el.toString());
    let head = this.snake.headPos().toString();
    return body.includes(head);
  }
  updateScore(){
    $("#score").html(this.score);
  }
}


module.exports = Board;
