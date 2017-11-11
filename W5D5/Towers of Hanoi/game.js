
class Game {
  constructor(reader, stacks = [[1,2,3], [], []]) {
    this.stacks = stacks;
    this.reader = reader;
  }

  promptMove() {
    console.log(this.stacks);
    this.reader.question("From what tower?\n", function (answer1) {
      this.reader.question("To what tower?\n", function (answer2) {
        if (this.isValidMove(answer1, answer2)) {
          this.move(answer1, answer2);
        } else {
          console.log("Invalid Move!");
          this.promptMove();
        }
      }.bind(this));
    }.bind(this));
  }

  isValidMove(startTowerIdx, endTowerIdx) {
    if ((startTowerIdx < 0 || startTowerIdx > 2) || (endTowerIdx < 0 || endTowerIdx > 2)) {
      return false;
    }
    if (this.stacks[startTowerIdx].length === 0){
      return false;
    }
    if (this.stacks[endTowerIdx].length === 0){
      return true;
    }
    if (this.stacks[startTowerIdx][0] < this.stacks[endTowerIdx][0]) {
      return true;
    } else {
      return false;
    }
  }

  move(startIdx, endIdx){
    this.stacks[endIdx].unshift(this.stacks[startIdx].shift());
    this.run();
  }

  run(cb){
    if (cb !== undefined){
      this.completionCallback = cb;
    }
    if (this.isWon()){
      this.reader.close();
      console.log(this.stacks);
      this.completionCallback();
    } else{
      this.promptMove();
    }
  }

  isWon(){
    return (this.stacks[1].length === 3 || this.stacks[2].length === 3 );
  }
}

module.exports = {Game};











//
