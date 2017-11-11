const Board = require("./board.js");

class View{
  constructor(el){
    this.el = el;
    this.board = new Board();
    this.addKeyListener();
    this.interval = window.setInterval(this.step.bind(this), 75);
  }

  buildGrid(){
    let grid = $("<ul class='grid'></ul>");
    for (var i = 0; i < 400; i++) {
      grid.append(`<li class="tile" id=${i}></li>`);
    }
    $(this.el).append(grid);
  }

  render(){
    $('.tile').removeClass('snake');
    $('.tile').removeClass('apple');
    this.rendercords([this.board.apple], 'apple');
    this.rendercords(this.board.snakeCords(), "snake");
  }

  rendercords(arr, cls){
    arr.forEach(function(cords){
      let cell = document.getElementById(View.cordToBox(cords));
      $(cell).addClass(cls);
    });
  }

  static cordToBox(cord){
    return 20*cord[1] + cord[0];
  }

  renderGrid(board){

  }

  addKeyListener(){
    $(window).keydown(this.handleKey.bind(this));
  }

  handleKey(e){
    console.log("key press");
    let key = e.which;
    let dir;
    switch(key){
      case 37:
        dir = 'W';
        break;
      case 38:
        dir = 'N';
        break;
      case 39:
        dir = 'E';
        break;
      case 40:
        dir = 'S';
        break;
    }
    this.board.snake.turn(dir);
  }

  step(){
    let status = this.board.update();
    console.log(status);
    if (!status){
      window.clearInterval(this.interval);
    }
    this.render();
  }
}

module.exports = View;
