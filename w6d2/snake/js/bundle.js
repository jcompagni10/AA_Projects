/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const View = __webpack_require__(1);

$(() =>{
  const el = $("#snake");
  // const board = new Board();
  const view = new View(el);
  view.buildGrid();
  view.render();
})

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Board = __webpack_require__(2);

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


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Snake = __webpack_require__(3);

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


/***/ }),
/* 3 */
/***/ (function(module, exports) {

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


/***/ })
/******/ ]);