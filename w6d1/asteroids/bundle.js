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

__webpack_require__(1);
const Game = __webpack_require__(1);
__webpack_require__(3);
__webpack_require__(4);



let g = new Game();
g.addAsteroids();


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const {Asteroid} = __webpack_require__(4);

const Game = function() {
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 10;
  this.asteroids = [];
};

const canvasEl = document.getElementById("canvas");
canvasEl.height = 500;
canvasEl.width = 500;
const ctx = canvasEl.getContext("2d");

Game.prototype.addAsteroids = function() {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++) {
    let newAsteroid = new Asteroid(
      [Math.random() * this.DIM_X,
      Math.random() * this.DIM_Y]
    );
    this.asteroids.push(newAsteroid);
    // console.log(newAsteroid.__proto__);
    // console.log(newAsteroid.prototype);
    newAsteroid.draw(ctx);
  }
};



module.exports = Game;


/***/ }),
/* 2 */,
/* 3 */
/***/ (function(module, exports) {

const MovingObject = function MovingObject(options){
  this.position = options['pos'];
  this.velocity= options['velocity'];
  this.radius= options['radius'];
  this.color= options['color'];

};

MovingObject.prototype.draw = function(ctx){
  ctx.beginPath();
  ctx.arc(this.position[0], this.position[1], this.radius, 0, 10);
  ctx.fillStyle = this.color;
  ctx.fill();
  
};

MovingObject.prototype.move = function(){
  this.position[0] += this.velocity[0];
  this.position[1] += this.velocity[1];
};

module.exports= {MovingObject};


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(5);
const {MovingObject} = __webpack_require__(3);
console.log(Util);

const Asteroid = function(pos) {
  const params = {color: 'purple',
  radius: 25,
  pos: pos,
  velocity: Util.randomVec(10)};

  // this.super(params);
  MovingObject.call(this, params);

};

Util.inherits(Asteroid, MovingObject);

// Asteroid.prototype.constructor = function(pos) {
//
// };


let a = new Asteroid([1,1]);
console.log(a);

module.exports = {Asteroid};


/***/ }),
/* 5 */
/***/ (function(module, exports) {

const Util = {

  inherits(childClass, parentClass) {
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.prototype.constructor = childClass;
  },
  // Return a randomly oriented vector with the given length.
  randomVec (length) {
    const deg = 2 * Math.PI * Math.random();
    return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  // Scale the length of a vector by the given amount.
  scale (vec, m) {
    return [vec[0] * m, vec[1] * m];
}
};

module.exports = Util;


/***/ })
/******/ ]);