// const {Board} = require('./board.js')

const MOVEDIRS = {E:[1,0], W:[-1,0], S:[0,1], N:[0,-1] }
class Snake{
  constructor(){
    this.direction = 'E';
    this.segments = [[1,1]];
  }
  move(){
    for (var i = 1; i < this.segments.length-1; i++) {
      let pos = this.segments.length - i;
      this.segments[pos-i] = this.segments[pos-i-1] ;
    }
    let head = this.segments[0];
    let dir = MOVEDIRS[this.direction];
    this.segments[0][0] = head[0] + dir[0];
    this.segments[0][1] = head[1] + dir[1];
  }
  turn(dir){
    this.direction = dir;
  }
}

module.exports = Snake;