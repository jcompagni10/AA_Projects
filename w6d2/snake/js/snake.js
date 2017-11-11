// const {Board} = require('./board.js')

const MOVEDIRS = {E:[1,0], W:[-1,0], S:[0,1], N:[0,-1] };
class Snake{
  constructor(){
    this.direction = 'E';
    this.segments = [[3,1],[2,1],[1,1],[0,1]];
    this.dPending = false;
  }
  move(){
    for (var i = 1; i < this.segments.length; i++) {
      let pos = this.segments.length - i;
      this.segments[pos] = this.segments[pos-1].slice(0);
    }
    let head = this.segments[0];
    let dir = MOVEDIRS[this.direction];
    this.segments[0][0] = head[0] + dir[0];
    this.segments[0][1] = head[1] + dir[1];
    this.dPending = false;
  }

  headPos(){
    return this.segments[0];
  }

  turn(dir){
    if(this.dPending){
      return null;
    }
    if (this.notOpposite(dir)){
      this.dPending = true;
      this.direction = dir;
    }
  }
  notOpposite(d1){
    return (MOVEDIRS[d1][0] + MOVEDIRS[this.direction][0] && MOVEDIRS[d1][1] + MOVEDIRS[this.direction][1]);
  }

  addLength(){
    let last = this.segments[this.segments.length-1];
    for (var i = 0; i < 4; i++) {
      this.segments.push(last);
    }
  }
}


module.exports = Snake;
