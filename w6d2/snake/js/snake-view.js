const Board = require("./board.js");

class View{
  constructor(el){
    this.el = el
  }
  
  buildGrid(){
    let grid = $("<ul class='grid'></ul>");
    for (var i = 0; i < 2500; i++) {
      grid.append(`<li class="tile" id=${i}></li>`);
    }
    $(this.el).append(grid);
  }
  
  static boxIdToCord(box){
  }
  renderGrid(board){
  
  }
}
module.exports = View