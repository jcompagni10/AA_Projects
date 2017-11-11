class HanoiView{
  constructor(game, el){
    this.game = game;
    this.el = el;
  }
  
  setupTowers(){
    let $stacks = ("<ul class='stacks'></ul>")
    for (var i = 0; i < 3; i++) {
      $stacks.append(`<li><ul id='${i}' class="stack"></ul></li>`)
    }
  }
}