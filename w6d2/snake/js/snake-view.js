const Board = require("./board.js");

class View{
  constructor(el){
    this.el = el
    this.board = new Board()
  }
  
  buildGrid(){
    debugger
    let grid = $("<ul class='grid'></ul>");
    for (var i = 0; i < 2500; i++) {
      grid.append(`<li class="tile" id=${i}></li>`);
    }
    $(this.el).append(grid);
  }
  
  render(){
    debugger
    rendercords(this.board.snakeCords(), "snake")
  }
  
  rendercords(arr, cls){
    arr.forEach(function(cords){
      let cell = document.getElementById(cordToBox(cords))
      $(cell).addClass(cls)
    }
  }
  static cordToBox(cord){
    return 50*cord[1] + cord[0]
  }
  
  renderGrid(board){
  
  }
}
module.exports = View