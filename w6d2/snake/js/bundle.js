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
})

/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Board = __webpack_require__(2);

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

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Snake = __webpack_require__(3)

class Board{
  constructor(){
    this.snake = new Snake();
    this.grid = [];
  }
}

module.exports = Board;

/***/ }),
/* 3 */
/***/ (function(module, exports) {

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

/***/ })
/******/ ]);