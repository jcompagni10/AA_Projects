const {Asteroid} = require('./asteroid.js');

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
