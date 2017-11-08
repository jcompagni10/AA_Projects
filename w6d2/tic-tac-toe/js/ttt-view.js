class View {
  constructor(game, $el) {
    this.game = game;
    this.el = $el;
  }
  
  bindEvents() {
    
    $(".board-stuff").on("click", "li", this.boardClick.bind(this))
  }
  
  boardClick (evt) {
    // debugger
    let $box = $(evt.target);
    let $boxid = $box.attr("id")
    
    const pos1 = Math.floor(parseInt($boxid) / 3);
    const pos2 = parseInt($boxid) % 3;
    
    
    if (this.game.board.isEmptyPos([pos1, pos2])) {
      $box.html(this.game.currentPlayer);
      $box.addClass("clicked")
      $box.addClass(this.game.currentPlayer)
      this.game.playMove([pos1, pos2]);
    } else {
      alert("Nah, bre!")
    }

    
  

    
    if (this.game.isOver()) {
      if (this.game.winner() === "x") {
        $(".x").addClass("winner")
        $(".o").addClass("loser")
        this.el.append("X is the winner!")
      } else if (this.game.winner() === "o") {
        $(".o").addClass("winner")
        $(".x").addClass("loser")
        this.el.append("O is the winner!")
      } else {
        $(".tile").addClass("draw")
        this.el.append("Everyone loses!")
      }
    }
  }
  
  makeMove($square) {
    
  }

  setupBoard() {
    let ul = $('<ul class="board-stuff"></ul>');
    for (var i = 0; i < 9; i++) {
      ul.append(`<li class="tile" id=${i}></li>`);
    }
    
    this.el.append(ul)
    
  }
}

module.exports = View;
